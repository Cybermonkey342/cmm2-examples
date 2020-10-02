' ***************************
' * Bouncing Balls ported   *
' * from Naalaa to MMBASIC  *
' * by Markus M.            *
' * Best result in mode 1,8 *
' * mode 10,8 or mode 8,8   *
' ***************************
option base 1
const RADIUS=16
const MAXBALLS = fix (mm.hres/RADIUS/2)
const groundY=400

dim balls.x(MAXBALLS)
dim balls.y(MAXBALLS)
dim balls.dy(MAXBALLS)

for i=1 to MAXBALLS
  balls.x(i)=(i-1)*RADIUS*2
  balls.y(i)=groundY-350+sin(i*45)*75
  balls.dy(i)=0.0
next
page write 2
cls
circle RADIUS,RADIUS,RADIUS,2,,RGB(red),RGB(yellow)
page write 1

do
  cls
    for i=1 to MAXBALLS
      balls.dy(i)=balls.dy(i)+0.1
      balls.y(i)=balls.y(i)+balls.dy(i)
      if balls.y(i) > (groundY-RADIUS) then
        balls.y(i) = (groundY-RADIUS)
        balls.dy(i)=-8.0
      endif
    next

  for i=2 to MAXBALLS
    blit 0,0,balls.x(i)-16,balls.y(i)-16,RADIUS*2+1,RADIUS*2+1,2,&B100
  next
  line 0,groundY,mm.hres,groundY,1,RGB(white)
  page copy 1 to 0,B 'no flickering please
loop until inkey$=chr$(27)


