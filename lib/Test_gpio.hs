import GPIO

pins = [(2,OUT),(3,IN)]

main = do
  --open (2,OUT)
  --open (3,IN)
  openArray pins
  pinOut (2,OUT) HIGH
  a <- pinIn  (2,IN)
  print a
  --close (2,OUT)
  --close (3,IN)
  closeArray pins
  --close 1 -- no pin
  print "OK"