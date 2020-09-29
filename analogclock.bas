' ****************************
' * Analog clock ported from *
' * Pascal to Lua to Allegro *
' * BASIC to MMBASIC by      *
' * William33 2/2016-9/2020  *
' ****************************

xcenter=mm.hres/2
ycenter=mm.vres/2

page write 1
do
  colour rgb (50,255,50),rgb(0,90,82)
  cls
  circle xcenter, ycenter, 150,,,rgb(0,0,0),rgb(0,0,0)
  for i=1 to 11
    if (i<>3) and (i<>6) and (i<>9) then
      circle fix(cos((i*30)*PI/180-PI/2)*140+xcenter),fix(sin((i*30)*PI/180-PI/2)*140+ycenter),3,,,rgb(50,255,50),rgb(50,255,50)
    endif
  next
  colour rgb (50,255,50),rgb(black)
  text xcenter-145,ycenter-5,"9"
  text xcenter+135,ycenter-5,"3"
  text xcenter-15,ycenter-145,"12"
  text xcenter-5,ycenter+130,"6"

  second=val (right$(time$,2))
  hour= val (left$(time$,2))
  minute= val (mid$ (time$,4,2))

  xsecond= fix (cos (second * PI /30 - PI /2) * 120+ xcenter)
  ysecond= fix (sin (second * PI /30 - PI /2) * 120+ ycenter)
  xminute= fix (cos (minute * PI /30 - PI /2) * 100+ xcenter)
  yminute= fix (sin (minute * PI /30 - PI /2) * 100+ ycenter)
  xhour = fix (cos ((hour * 30 + minute/2) * PI/180-PI/2) * 80+xcenter)
  yhour = fix (sin ((hour * 30 + minute/2) * PI/180-PI/2) * 80+ycenter)

  line xcenter, ycenter, xsecond, ysecond, 1, rgb (red)
  
  line xcenter, ycenter-1, xminute, yminute, 1, rgb (white)
  line xcenter-1, ycenter, xminute, yminute, 1, rgb (white)
  

  line xcenter, ycenter-1, xhour, yhour, 1, rgb (yellow)
  line xcenter-1, ycenter, xhour, yhour, 1, rgb (yellow)



  page copy 1 to 0,b

loop until inkey$=chr$(27)
