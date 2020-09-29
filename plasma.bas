' A static plasma "thingy"
' by Markus 
mode 10,16
cls
width=mm.vres
height=mm.hres

dim cols (4,257)
for i=1 to 256
  cols (1,i)=abs (128-127*sin(i*pi/32))
  cols (2,i)=abs (128-127*sin(i*pi/64))
  cols (3,i)=abs (128-127*sin(i*pi/128))
next

for y=0 to width
  for x=0 to height
    c=fix ((sin(x/35)*128+sin(y/28)*32+sin ((x+y)/16)*64))
    
    if c>255 then c=c-256
    if c<1 then c=256+c
    r=cols (1,c)
    if r>256 then r=r-257
    if r<1 then r=257+c
    g=cols (2,c)
    if g>256 then g=g-257
    if g<1 then g=257+c
    b=cols (3,c)
    if b>256 then b=b-257
    if b<1 then g=257+c
    
    pixel x,y,rgb(r,g,b)
  next
next
text 5,5,"Press any key to exit.","N",3,1,rgb(255,255,0),0

do 
loop until inkey$<>""

