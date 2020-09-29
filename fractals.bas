mode 7,16

dim as integer bx=0
dim as integer  by=0
dim as integer  bw=mm.vres
dim as integer  bh=mm.vres

dim as float sx=-2.2
dim as float  sy=-1.7
dim as float  sw=3.4
dim as float  sh=3.4

dim as integer x,y, time1, time2, c, col,  r, v, b, timex
dim as float gx,gy,zx,zy, nzx

page write 1
cls

for x=bx to bx+bw
 for y=by to by+bh 
   gx=(x-bx)/bw*sw+sx
   gy=(y-by)/bh*sh+sy
   zx=gx
   zy=gy
   for c=0 to 255
    col = c
    nzx=zx*zx - zy*zy + gx
    zy=2*zx*zy+gy
    zx=nzx
    if zx*zx + zy*zy > 4 then
      col = c 
      exit for
    endif
  next
  r = col*256+col*32*0.5
  v = col*256+col*64*0.5
  b = col*256+col*32*0.8      
  pixel x,y,rgb (r mod 256,v mod 256,b mod 256)

 next
page copy 1 to 0
next
page write 0
text 0,0,"Pres ESC to exit."
do 
loop until inkey$=chr$(27)


