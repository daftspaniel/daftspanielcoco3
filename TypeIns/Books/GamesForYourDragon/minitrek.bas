10 REM******************** 
20 REM*****MINI-TREK******
30 REM*****C.GIFFORD******
40 REM******************** 
60 K=0 
70 E=1000 
80 PMODE 4,1 : PCLS : SCREEN 1,1
90 DRAW "BM40,130;U20F12E12D20BR10U20BR10D20BU20F20U20BR10D20"
100 DRAW "BR30U20L10R20BR10D20U10F10BU10U10L10D10BR10U10D20R12L12U10R10L10U10R12"
110 DRAW "BR10D20U10E10BD20H10"
120 FOR P=1 TO 100
130 G=RND(255) :H=RND(191)
140 PSET(G,H,1)
150 NEXT P 
160 CIRCLE(210,50),15
170 CIRCLE(210,50),25, 1, 0.4
180 CIRCLE(210,50),28, 1, 0.4 
190 A=RND(8):B=RND(8)
200 FOR T=1 TO 1000 :NEXT T
210 PLAY STR$(RND(12))
220 CLS 
230 REM 
240 PRINT CHR$(159)+CHR$(159); "ENERGY UNITS" ;E;CHR$(159);" MOVE"; K ; CHR$(159) +CHR$(159) 
250 PRINT:PRINT"WARP TO WHERE?" 
260 INPUT X,Y
270 IF X<1 OR X> 8 OR Y<1 OR Y>8 THEN PRINT " ' DUFF ' MOUE GUV! TRY AGAIN" : GOTO 260 
280 K=K+1
290 E=E-50: IF E<1 THEN GOTO 950
300 IF X=A AND Y=B THEN GOTO 470 
310 R=RND(9): IF R>6 THEN GOSUB 630 
320 REM 
330 FOR Z=1 TO RND (22)
340 READ ZZ$ 
350 NEXT Z 
360 DATA "A BLACK HOLE", "A CAPSULE", "A SUPERNOVA" , "AN ASTEROID BELT" , "A FUEL POD", "A STARBASE"
370 DATA "A SUPERNOVA" , "NOTHING AT ALL " , "A TINY PLANET", "SPACE DEBRIS", "A DISUSED CRAFT", " NOTHING", "LITTLE OF VALUE" 
380 DATA "SOME SMALL STARS", "A STARBASE", "A STARBASE", "A SPINNING ORB", "A PASSING COMET", "A CRUISING SHIP", "NIL" , "A FUEL POD", "-----"
390 PRINT : PRINT "SECTOR CONTAINS " ; ZZ$ 
400 IF ZZ$="A FUEL POD" THEN PRINT "*****extra energy units*****" : E=E + 500 : SOUND l80 ,6 
410 IF ZZ$="A SUPER NOVA" OR ZZ$= "A BLACKHOLE" THEN GOTO 950 
420 IF ZZ$="A CAPSULE" THEN PRINT "WHICH GIVES YOU YOUR HOMEBASE COORDINATES" :PRINT : PRINT A ; " , " ; B 
430 IF ZZ$="A STARBASE" THEN PRINT "ENERGY SUPPLIES ARE REPLENISHED ALL DAMAGES ARE REPAIRED. LEAVE NOW AND SEARCH FOR HOMEBASE " :E=1000 : FOR T=J TO 800 : NEXT T 
440 IF ZZ$="A SPINNING ORB" THEN PLAY"L80O2CO4CO2CO4CO2CO4CO2CO4C"
450 RESTORE 
460 GOTO 200 
470 PMODE 4,1 :PCLS : SCREEN 1,1 
480 CIRCLE (128, 96), 70
490 CIRCLE (128, 96), 45, 1, 1.5
500 CIRCLE (128, 96), 14, 1, 5 
510 PAINT (78,96), 1, 1
520 PAINT (180, 96), 1, 1 
530 PAINT (128, 96), 1, 1
540 FOR T=J TO 50 : G=RND(255) : H= RND(191)
550 PSET(G,H,1)
560 NEXT T
570 FOR E= I TO 10 
580 DRAW "BM20,20U10D5R8U5D10BR5U10R10D10L10BR15U10F5E5D10BR5R10BL10U5R8BL8U5R10" 
590 PLAY "L100O4CDECDECDECDE" 
600 LINE (20, 10) -(80, 40) , PRESET ,BF 
610 NEXT E 
620 END
630 PRINT "SECTOR CONTAINS "; 
640 PLAY "V31L20O3BCBCBCBC"
650 PRINT "aliens"
660 PRINT:PRINT "DO YOU WANT TO FIGHT OR RUN?"
670 INPUT A$ :IF A$= "R" THEN GOTO 840 
680 PRINT "BRAVE MAN ... CHOOSE YOUR WEAPON : " : PRINT 
690 PRINT "1*PHASERS------NO UNITS         2*PLASMA BOLT--NO UNITS         3*DRAGON BEAM--400 UNITS" 
700 INPUT W : IF W>3 OR W<1 THEN GOTO 700 
710 IF W=3 THEN E =E-400 : GOTO 810 
720 PRINT "THE FIGHT BEGINS. TO FIRE, PRESS ENTER" 
730 INPUT N$ :PLAY "L200EDEFEDEFEDEFECCFEDEFEDEFEDEF" 
740 M=RND(11) :IF M>5 THEN GOTO 810 
750 E=E-800 : IF E<1 THEN GOTO 950 
760 PRINT" YOU LOST AND ARE BADLY DAMAGED."
770 SOUND 1,4 
780 PRINT"YOU MUST GET TO A STAR BASE FAST OR IT'S CURTAINS FOR YOU."
790 FOR T=1 TO 1000 : NEXT T 
800 GOTO 200 
810 PLAY "L4V25O3ABGO2GO3L2D" 
820 PRINT "      "; CHR$(255) + CHR$(255); "SUCCESS"; CHR$(255) + CHR$(255)
830 GOTO 200 
840 PRINT "++++++CHICKEN++++++" 
850 PLAY "L50O1CGC"
860 PRINT " PRESS HYPERSPACE BUTTON. (H)" 
870 IF INKEY$="H" THEN GOSUB 890 ELSE GOTO 870 
880 END 
890 X=RND(8): B=RND(8)
900 PRINT "YOU HAUE BEEN RANDOMLY PLACED SOMEWHERE IN THE UNIUERSE AND HAVE LOST 200 ENERGY UNITS. " 
910 E=E-200:IF E<1 THEN GOTO 950 
920 PLAY"L80CGCGCGCGCGCGCG"
930 FOR T=1 TO 1000 : NEXT T 
940 GOTO 200 
950 FOR T=1 TO 1000 : NEXT T 
960 PMODE 3, 1 : PCLS :SCREEN 1,0 
970 FOR R=1 TO 80 STEP 4
980 CIRCLE (128, 96), R, 3, 0 . 75 
990 NEXT R 
1000 PLAY"L20O1CDE" 
1010 FOR R=0 TO 79 STEP 5 
1020 CIRCLE(128,96),R,4,0.85 
1030 NEXT R 
1040 PLAY "L20EFG"
1050 FOR R=2 TO 81 STEP 5 
1060 CIRCLE (128 , 96) , R , 2,0.5 
1070 NEXT R 
1080 PLAY "L20GABBAB"
1090 CLS0 :PRINT @ 196 , "YOU'VE BEEN VAPOURISED";
1100 SOUND1,12
1110 GOTO 960