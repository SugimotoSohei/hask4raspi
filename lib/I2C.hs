module I2C where

data Bin = Zero | One
type Address = [Bin]

d2b :: Int -> Address
d2b n = [I2C.Zero]

i2cStart = do
    print "start_test"