100 CLS
110 DIM A$(10)
120 FOR X=1 TO 10
130 READ A$(X)
140 PRINT A$(X)
150 NEXT
160 X=10:Y=5
170 ?@32*Y+X,"@";
180 I$=INKEY$:IF I$="" THEN 180
190 IX=0:IY=0
210 IF I$="O" THEN IX=-1
220 IF I$="P" THEN IX=1
230 IF I$="Q" THEN IY=-1
240 IF I$="A" THEN IY=1
245 ?@32*Y+X," ";
250 IF PEEK(1024+X+((Y+IY)*32))<>79 THEN Y=Y+IY
255 IF PEEK(1024+X+IX+(Y*32))<>79 THEN X=X+IX
260 GOTO 170
270 DATA "OOOOOOOOOOOOOOOOOOOO"
280 DATA "O     O     O      O"
290 DATA "OOOOO O     O  OO  O"
300 DATA "O     O     O      O"
310 DATA "O     O        OOOOO"
320 DATA "OOOO    O       O  O"
330 DATA "O  O    O OOOO  O  O"
340 DATA "O  OOOO O          O"
350 DATA "O       O          O"
360 DATA "OOOOOOOOOOOOOOOOOOOO"
