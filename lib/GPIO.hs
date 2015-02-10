module GPIO where

data PinMode = IN | OUT deriving (Eq)
--data Pin = Pin Int deriving (Show,Eq)
data Value = HIGH | LOW deriving (Show,Eq)

type Pin = (Int,PinMode)
type PinNum = Int

instance Show PinMode where
  show IN  = "IN"
  show OUT  = "OUT"

pinAssign :: [PinNum]
pinAssign = [2,3,4,7,8,9,10,11,14,15,17,18,22,23,24,25,27] ++ [5,6,12,13,16,20,21,26]
-- ++ の後はraspiのtypeによって異なる。扱いはあとで検討

pin2Char :: PinNum -> String
pin2Char n
  | n `elem` pinAssign = show n
  | otherwise = error "no pin number"


close :: PinNum -> IO ()
close x = putStrLn $ "closepin = " ++ pin2Char x

-- gpiofile "/sys/class/gpio"