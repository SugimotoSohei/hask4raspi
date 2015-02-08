import I2C

main = do
    print $ d2b 16
    print $ d2b 100
    print $ d2h 100
    print $ d2b 0 
    i2cStart 