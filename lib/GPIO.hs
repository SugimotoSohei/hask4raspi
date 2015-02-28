module GPIO where

data PinMode = IN | OUT deriving (Eq)
data Value = HIGH | LOW deriving (Eq)

type Pin = (PinNum,PinMode)
type PinNum = Int

instance Show PinMode where
  show IN  = "IN"
  show OUT  = "OUT"

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
  writeFile "./txt/test_open.txt" $ pin2Char x
  writeFile "./txt/test_mode.txt" $ show y

close :: Pin -> IO ()
close (x,_) = writeFile "./txt/test_close.txt" $ pin2Char x

closeNum :: PinNum -> IO ()
closeNum x = writeFile "./txt/test_close.txt" $ pin2Char x

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
  | y == OUT = writeFile ("./txt/test_" ++ (pin2Char x) ++ "out.txt") $ show z
  | otherwise = error "output error"

--pinIn :: Pin -> IO String
pinIn (x,y)
  | y == IN = readFile "./txt/test_read.txt"
  | otherwise = error "Read error"

-- gpiofile "/sys/class/gpio"