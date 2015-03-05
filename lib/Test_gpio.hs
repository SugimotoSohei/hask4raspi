import GPIO

pins = [(21,OUT),(20,IN)]

main = do
  --open (2,OUT)
  --open (3,IN)
  openArray pins
  pinOut (21,OUT) HIGH
  a <- pinIn (20,IN)
  print a
  --close (2,OUT)
  --close (3,IN)
  closeArray pins
  --close 1 -- no pin
  print "OK"