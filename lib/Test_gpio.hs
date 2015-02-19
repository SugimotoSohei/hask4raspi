import GPIO

main = do
  open (2,OUT)
  open (3,IN)
  pinOut (2,OUT) HIGH
  a <- pinIn  (2,IN)
  print a
  close (2,OUT)
  close (3,IN)
  --close 1 -- no pin
  print "OK"