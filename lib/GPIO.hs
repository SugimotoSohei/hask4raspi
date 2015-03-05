module GPIO where

data PinMode = IN | OUT deriving (Eq)
data Value = HIGH | LOW deriving (Eq)

type Pin = (PinNum,PinMode)
type PinNum = Int

instance Show PinMode where
  show IN  = "in"
  show OUT  = "out"

instance Show Value where
  show HIGH = "1"
  show LOW  = "0"

pinAssign :: [PinNum]
pinAssign = [2,3,4,7,8,9,10,11,14,15,17,18,22,23,24,25,27] ++ [5,6,12,13,16,20,21,26]
-- ++ の後はraspiのtypeによって異なる。扱いはあとで検討

pin2Char :: PinNum -> String
pin2Char n
  | n `elem` pinAssign = show n
  | otherwise = error "no pin number, Stop ."

open :: Pin -> IO ()
open (x,y) = do
  writeFile "/sys/class/gpio/export" $ pin2Char x
  writeFile ("/sys/class/gpio/gpio"++(pin2Char x)++"/direction") $ show y

close :: Pin -> IO ()
close (x,_) = writeFile "/sys/class/gpio/unexport" $ pin2Char x

closeNum :: PinNum -> IO ()
closeNum x = writeFile "/sys/class/gpio/unexport" $ pin2Char x

openArray :: [Pin] -> IO [()]
openArray ps
  | ps == [] = error "Error34"
  | otherwise = sequence $ map open ps

closeArray :: [Pin] -> IO [()]
closeArray ps
  | ps == [] = error "Error34"
  | otherwise = sequence $ map close ps

pinOut :: Pin -> Value -> IO ()
pinOut (x,y) z
  | y == OUT = writeFile ("/sys/class/gpio/gpio ++ (pin2Char x) ++ "/value") $ show z
  | otherwise = error "output error"

--pinIn :: Pin -> IO String
pinIn (x,y)
  | y == IN = readFile ("/sys/class/gpio/gpio"++(pin2Char x)++"/value")
  | otherwise = error "Read error"

-- gpiofile "/sys/class/gpio"