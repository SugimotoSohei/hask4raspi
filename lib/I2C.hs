module I2C where

baseNumComv :: Int -> Int -> [Int] -> [Int]
baseNumComv x n xs
    | x == 0 = xs
    | x == 1 = (1:xs)
    | otherwise = ss : baseNumComv ns n xs
        where ss = x `mod` n
              ns  = x `div` n

d2b :: Int -> [Int]
d2b n = reverse $ baseNumComv n 2 []

d2h :: Int -> [Int]
d2h n = reverse $ baseNumComv n 16 []

i2cStart = do
    print "start_test"