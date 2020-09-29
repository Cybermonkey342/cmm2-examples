mode 10,16

width=mm.hres
height=mm.vres


colour 0,rgb(white)
page write 1
cls

dim as integer x,y,i,timer1,timer2
dim zm as integer = 120
dim miter as integer = 128
dim as float zx,zy, cx,cy,tmp

for y=0 to height-1
  for x=0 to width-1
    zx=0
    zy=0
    cx= (x-width/2)/zm
    cy= (y-height/2)/zm
    i = miter
  do while zx*zx+zy*zy <4 and i >0 
    tmp = zx * zx - zy * zy + cx
    zy = 2 * zx * zy + cy
    zx = tmp
    i=i-1
  loop
   pixel x,y,rgb(i*12 mod 256,i*8 mod 256,i*4 mod 256)
  next
page copy 1 to 0
next
page write 0
text 0,0,"Press ESC to exit."
do 
loop until inkey$=chr$(27)


