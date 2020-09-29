'********************************
'* Barnsley's fern without CSUB *
'* by Markus William            *
'* needs resolution 1024x768    *
'********************************

mode 9,8
page write 1
cls
const TRUE=1
const FALSE=0

x=0
y=0
x1=0
x2=0
go=FALSE

for n=1 to 40000
  r=rnd
  if r<=0.01 then
    x=0
    y=0.16*y
    go=TRUE
  elseif r<=0.07 then
    x=0.2*x-0.26*y
    y=0.23*x+0.22*y+1.6
    go=TRUE
  elseif r<=0.15 then
    x=-0.15*x+0.28*y
    y=0.26*x+0.24*y+0.44
    go=TRUE
  endif
  if go=FALSE then
    x=0.85*x+0.04*y
    y=-0.04*x+0.85*y+1.6
  endif  
  x1=(x+3)*70
  x2=700-y*70
  pixel x1,x2,rgb(green)
  go = FALSE
next
text 0,0,"Press ESC to exit."
page copy 1 to 0,b
do
loop until inkey$=chr$(27)
 
