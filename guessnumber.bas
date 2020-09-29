' Just a "guess the number" game
' By M.W. Mangold

colour rgb(yellow)
tries=0
cls
Input "What shall be the highest number"; maxnumber
result=int (rnd*maxnumber)+1
do
  colour rgb (yellow)
  tries=tries+1
  Print str$(tries)+". Guess a number between 1 and "+str$(maxnumber);
  input guess
  if guess < result then
    colour rgb(red)
    print "My number is higher."
  elseif guess > result then
    colour rgb (green)
    print "My number is lower."
  endif
loop until guess = result
colour rgb (yellow)
print
if tries <= 1 then 
  print "Congratulations! You guessed the number with the first try!"
else
  Print "Congratulations! You guessed the number with "+str$(tries)+" tries."
endif


