10 CLEAR 4000
20 DIM LO$(64), DI$(64) :REM location and directions
30 DIM LI : REM location index
40 DIM V$, N$ : REM verb and noun
45 BO$=STRING$(32,CHR$(211))
50 OO=14 : DIM OT$(OO), OD$(OO), OC(OO), OL(OO) 
51 REM objects, descriptions. carrying flags, location
60 GOSUB 9000 : REM setup data
70 GOSUB 8000 : REM title
80 LI=47 : LD$=LO$(LI) : LE$=DI$(LI) : KX = 0
85 REM LI=10
90 GOSUB 2000 : REM instructions
100 CLS:REM main game screen
110 PRINT@0,"": PRINT@32,"": PRINT@64,"": PRINT@96,"": PRINT@128,""
120 PRINT@0,LO$(LI) 
125 PRINT:IFLI=11THENPRINT"THE GLOWING BRANCH LIGHTS       THE WAY!":PRINT
127 IF LI=9 AND KX=1 THEN PRINT"YOU CAN HEAR A LOW HUM."
128 IF LI=9 AND KX=2 THEN PRINT"YOU CAN HEAR A LOUD HUM."
130 PRINT@224, "exits " + DI$(LI)+"   ";
140 O$="items " : FOR J=1 TO OO:
142 IF OL(J)=LI THEN O$ = O$ + OT$(J) + " "
145 NEXT
146 IF LEN(O$)>8 THEN PRINT @192, O$: GOTO 150
148 PRINT@192,""
150 PRINT@256,BO$;
155 PRINT@288,"": PRINT@320,"": PRINT@352,"": PRINT@384,"": PRINT@416,""
160 PRINT@288,"";:INPUT I$
170 S = INSTR(I$," ")
180 IF S=0 THEN V$=I$:N$=""
190 IF S>0 THEN V$=LEFT$(I$,S-1):N$=MID$(I$,S+1)
195 IF V$="GO" THEN V$=N$:N$=""
200 REM PRINT "["+V$+"]["+N$+"]"
202 IF V$="I" THEN GOSUB 400 : GOTO 110
203 REM IF V$="X" THEN GOSUB 450 : GOTO 110
205 OI=0:FOR J=1 TO OO : IF OT$(J)=N$ THEN OI=J
206 NEXT
210 IF V$="GET" AND LEN(N$)>0 THEN GOSUB 300 : GOTO 110
213 IF V$="DROP" AND LEN(N$)>0 THEN GOSUB 500 : GOTO 110
216 IF (V$="LOOK" OR V$="EXAMINE" OR V$="L" OR V$="E") AND LEN(N$)>0 THEN GOSUB 600 : GOTO 110
220 IF V$="PUT" AND N$="CUBOID" AND LI=18 AND OC(14)=1 THEN PRINT "THE CUBE AND THE CUBOID MERGE   TOGETHER.":OC(14)=0:KX=KX+1:GOTO298
230 IF V$="PLAY" AND N$="FLUTE" AND LI=2 AND OC(OI)=1 THEN PRINT "THE FOUNTAIN SPRINGS TO LIFE.":KX=KX+1:GOTO298
235 IF LI=9 AND V$="PULL" AND N$="LEVER" AND KX=0 THEN PRINT "THE LEVER DOES NOT MOVE.": GOTO 298
236 IF LI=9 AND V$="PULL" AND N$="LEVER" AND KX=1 THEN PRINT "THE LEVER MOVES TO 45 DEGREES.": GOTO 298
238 IF LI=9 AND V$="PULL" AND N$="LEVER" AND KX=2 THEN PRINT "THE LEVER MOVES AGAIN!":SOUND103,2:SOUND123,3:GOSUB6000:LI=57:GOTO 298
240 IF V$="DIG" THEN GOSUB 700 : GOTO 110
242 IF V$="PLAY" AND N$="FLUTE" AND OC(OI)=1 THEN PRINT "IT PRODUCES A CLEAR SOUND." : GOTO 298
245 IF LEN(N$)>0 AND OI=0 THEN PRINT "I DON'T KNOW WHAT '"+N$+"' IS!":GOTO298
246 IF LI=58 AND V$="USE" AND N$="TELESCOPE" THEN PRINT "YOU SEE A CLEAR CRISP SKY.      YOU HEAR SUDDEN NOISE!":SOUND200,4::GOSUB 5200:GOSUB 7500
247 IF LEN(N$)>0 AND OI>0 AND OC(OI)=0 THEN PRINT "YOU DON'T HAVE A " + N$ +".":GOTO298
250 IF LI=28 AND V$="E" AND INSTR(DI$(28),"E")=0 THEN PRINT "THE UNDERGROWTH IS TOO THICK!":GOTO298
255 IF LI=12 AND V$="W" AND OC(9)=0 THEN PRINT "IT IS TOO DARK TO GO THAT WAY!":GOTO298
256 IF LI=10 AND V$="E" AND OC(9)=0 THEN PRINT "IT IS TOO DARK TO GO THAT WAY!":GOTO298
260 IF LI=28 AND V$="USE" AND N$="MACHETE" AND OC(OI)=1 THEN PRINT "YOU CLEAR A PATH TO THE DOOR.":SOUND200,1:DI$(LI)="SEW":GOSUB5200:GOTO110
270 IF LI=43 AND V$="USE" AND N$="ROPE" AND OC(OI)=1 THEN PRINT "YOU FIND SOMETHING ON THE LEDGE!":SOUND200,1:OL(6)=43:GOSUB5200:GOTO110
280 IF LI=24 AND V$="PUT" AND N$="CRYSTAL" AND OC(OI)=1 THEN PRINT "THE DOOR SHUTS BEHIND YOU!":SOUND200,4::GOSUB 5200:GOSUB7000:LI=23:OC(OI)=0:OL(OI)=1:GOTO110
290 IF INSTR("NSEW",V$)>0 AND INSTR(DI$(LI),V$)=0 THEN PRINT "YOU CAN'T GO THAT WAY." : GOTO 160
291 IF V$="N" THEN LI=LI-8:GOTO110
292 IF V$="S" THEN LI=LI+8:GOTO110
293 IF V$="E" THEN LI=LI+1:GOTO110
294 IF V$="W" THEN LI=LI-1:GOTO110
295 IF V$+N$="" THEN PRINT "SAY SOMETHING!":GOTO298
296 PRINT "I DON'T KNOW WHAT YOU MEAN!"
298 SOUND150,1:GOSUB 5200
299 GOTO 110
300 REM get
310 PU=0
330 FOR J=1 TO OO 
340 IF OL(J)=LI AND OT$(J)=N$ AND J<>8 AND J<>10 AND J<>11 THEN OL(J)=0:OC(J)=1:PU=1:SOUND200,1
350 IF OL(J)=LI AND OT$(J)=N$ AND (J=8 OR J=10 OR J=11) THEN PU=2
360 NEXT
370 IF PU=0 THEN PRINT "THERE IS NO " + N$ + " HERE!":SOUND150,1:GOSUB 5200
380 IF PU=2 THEN PRINT "THE " + N$ + " IS TOO HEAVY!":SOUND150,1:GOSUB 5200
390 RETURN
400 REM inventory
405 CC=0:FOR J=1 TO OO : IF OC(J)=1 THEN PRINT " * " + OT$(J):CC=CC+1
410 NEXT
420 IF CC=0 THEN PRINT "YOU ARE NOT CARRYING ANYTHING!":SOUND150,1:GOSUB 5200
430 IF CC>0 THEN GOSUB 5100:CLS
440 RETURN
450 REM cheat
460 FOR J=1 TO OO : OC(J)=1 : NEXT
480 RETURN
500 REM drop
510 PU=0
530 FOR J=1 TO OO : IF OC(J)=1 AND OT$(J)=N$ THEN OL(J)=LI:OC(J)=0:PU=1:SOUND100,1
570 NEXT
580 IF PU=0 THEN PRINT "YOU ARE NOT CARRYING A " + N$ + "!":SOUND150,1:GOSUB 5200
590 RETURN
600 REM look
610 CD$=""
620 IF N$="STATUE" THEN CD$=OD$(8)
622 IF N$="CUBE" THEN CD$=OD$(10)
624 IF N$="FOUNTAIN" THEN CD$=OD$(11)
630 FOR J=1 TO OO : IF OC(J)=1 AND OT$(J)=N$ THEN CD$=OD$(J):SOUND100,1
670 NEXT
680 IF CD$="" THEN PRINT "YOU ARE NOT CARRYING A " + N$ + "!":SOUND150,1:GOSUB 5200:GOTO 690
685 PRINT CD$;:GOSUB 5300
690 RETURN
700 REM dig
710 IF OL(3)=1 AND LI=61 THEN PRINT "YOU FOUND SOMETHING!": OL(3) = 61:GOTO 730
720 PRINT "YOU DIG BUT FIND NOTHING."
730 GOSUB 5200
740 RETURN
2000 CLS
2010 PRINT "instructions":PRINT
2020 PRINT"THIS GAME IS A CLASSIC TEXT"
2030 PRINT"ADVENTURE - PEN AND PAPER FOR"
2040 PRINT"MAP DRAWING IS RECOMMENDED."
2050 PRINT
2060 PRINT"main controls"
2070 PRINT"N,S,E,W - MOVE AROUND"
2080 PRINT"I - LIST ITEMS YOU ARE CARRYING"
2100 PRINT
2110 PRINT"other verbs"
2130 PRINT"GET, DROP, USE, PUT, LOOK, DIG"
2140 PRINT"PULL, PLAY"
2400 GOSUB 5100
3000 CLS:PRINT
3010 PRINT"YOU AWAKE IN YOUR CABIN, BRUISEDDAZED AND CONFUSED. ":PRINT
3020 PRINT"THE DAY BEFORE YOU SET OFF ON A DREAM SOLO YACHT TRIP.":PRINT
3023 PRINT"THE DAY'S TRAVEL WAS UNEVENTFUL.":PRINT:
3024 PRINT"YOU REMEMBER ENDING THAT NIGHT  WITH A LIGHT DRINK BEFORE       RETIRING."
3025 GOSUB5100
3029 CLS:PRINT
3030 PRINT"FROM THE LACK OF MOTION, YOU    KNOW SOMETHING STRANGE HAS      HAPPENED. THE VIEW FROM THE     PORTHOLES IS BLOCKED WITH ROCK.":PRINT
3040 PRINT"LOOKING AROUND EVERYTHING HAS   BEEN TAKEN FROM YOUR VESSEL.    WHEREVER YOU ARE, IT IS HOT.":PRINT
3050 PRINT"SLOWLY YOU GET ON YOUR FEET AND BEGIN TO SURVEY YOUR            PREDICAMENT...     "
3055 GOSUB5100
5100 A$=INKEY$:IFA$=""THEN5100
5110 RETURN
5200 FOR D=1 TO 999:NEXT
5210 RETURN
5300 FOR D=1 TO 2999:NEXT
5310 RETURN
5400 PLAY"T7V8GP3GV16FV31GFGFGBGGGFGFGFGBBGFGP3V16GP3V8GP3V4GV3GV2GV1G"
5410 RETURN
6000 CLS 0
6010 FOR S=1 TO 21
6020 SET(RND(64)-1,RND(32)-1,5)
6030 FORD=1TO100:NEXTD
6040 SOUND 200+RND(50),1
6120 NEXT
6500 RETURN
7000 CLS 0
7010 DH=10:AP$=STRING$(32,CHR$(175)):WR=448
7020 FORGR=1TO16
7030 IF (GR/2)=INT((GR/2)) THEN PRINT@8,"PREPARE"+CHR$(128)+"TO"+CHR$(128)+"DIVE";:GOTO7037
7035 PRINT@8,"prepare"+CHR$(128)+"to"+CHR$(128)+"dive";
7037 SOUND 200,1:FOR D=1 TO 150:NEXT
7040 NEXT:CLS0
7120 PRINT@8,"depth";:PRINT@14,STR$(DH);
7130 FOR D=1 TO 5:NEXT:SOUND55,1
7140 DH=DH+500+RND(600)
7150 PRINT@WR,AP$;:WR=WR-32
7160 IF DH<12000 AND WR>-1 THEN GOTO 7120
7170 PLAY"T6V10BGV16AGBGV8GV4GV3GV2GV1G"
7180 CLS:RETURN
7500 CLS0
7560 FOR D=1TO100:NEXTD
7570 PRINT @32,"a"+CHR$(128)+"door"+CHR$(128)+"opens"+CHR$(128)+"and"+CHR$(128)+"you"+CHR$(128)+"walk"+CHR$(128)+"out";
7575 FOR D=1TO400:NEXTD
7580 PRINT @96,"tired"+CHR$(128)+"of"+CHR$(128)+"surprises"+CHR$(128)+"and"+CHR$(128)+"anxious";
7585 FOR D=1TO400:NEXTD
7590 PRINT @160,"for"+CHR$(128)+"normality"+CHR$(128)+"and"+CHR$(128)+"rest";
7595 FOR D=1TO400:NEXTD
7600 PRINT @256,"but"+CHR$(128)+"out"+CHR$(128)+"in"+CHR$(128)+"the"+CHR$(128)+"open";
7605 FOR D=1TO400:NEXTD
7610 PRINT @320,"a"+CHR$(128)+"shimmering"+CHR$(128)+"gateway"+CHR$(128)+"appears";
7611 FOR D=1TO400:NEXTD
7612 PRINT @384,"the"+CHR$(128)+"journey"+CHR$(128)+"is"+CHR$(128)+"not"+CHR$(128)+"over";
7615 PLAY"V6GAV5GAP1V4GAV2GAV1G"
7616 PLAY"V6GAV5GAP1V4GAV2GAV1G"
7620 FORT=1024TO1535:READA:POKET,A:NEXT
7621 PRINT @488,"to";:PLAY"V5GP1"
7622 PRINT @491,"be";:PLAY"V7AP1"
7623 PRINT @494,"continued";:PLAY"V7AP1"
7624 GOSUB5400
7640 PRINT @346,CHR$(233)+CHR$(233)+CHR$(233);
7650 PRINT @378,CHR$(233)+CHR$(233)+CHR$(233);
7660 PRINT @410,CHR$(233)+CHR$(233)+CHR$(233);
7670 PRINT @442,CHR$(233)+CHR$(233)+CHR$(233);
7680 PRINT @474,CHR$(233)+CHR$(233)+CHR$(233);
7681 FORD=1TO100:NEXTD
7682 PRINT @346,CHR$(153)+CHR$(153)+CHR$(153);
7683 PRINT @378,CHR$(153)+CHR$(153)+CHR$(153);
7684 PRINT @410,CHR$(153)+CHR$(153)+CHR$(153);
7685 PRINT @442,CHR$(153)+CHR$(153)+CHR$(153);
7686 PRINT @474,CHR$(153)+CHR$(153)+CHR$(153);
7690 FORD=1TO100:NEXTD
7895 GOTO7640
7898 END
8000 CLS
8010 PRINT@448,"      INGRESS ISLAND  v0.1";
8015 PRINT@480,"    retroCHALLENGE SEPT 2018";
8020 FORZT=1024TO1471:READZA:POKEZT,ZA:NEXT
8030 GOSUB5400
8400 GOSUB5100
8410 RETURN
9000 REM DATA
9010 FORJ=1TO64:READDI$(J),LO$(J):NEXT
9015 FORJ=1TOOO:READOT$(J),OD$(J),OL(J):OC(J)=0:NEXT
9020 DATA "NSEW","ITEM ROOM. "
9030 DATA "S","YOU ARE IN A TILED CIRCULAR     ROOM. IN THE CENTRE IS A DRY    FOUNTAIN. "
9040 DATA "NSEW","VOID. "
9050 DATA "NSEW","VOID. "
9060 DATA "NSEW","VOID. "
9070 DATA "SE","YOU ARE IN AN EMPTY DORMITORY.  ONLY BEDFRAMES REMAIN. "
9080 DATA "EW","YOU ARE IN A CURVING PASSAGEWAY."
9090 DATA "SW","YOU ARE IN A CURVING PASSAGEWAY.THE SLOPE IS STEEP. "
9100 DATA "E","YOU ARE IN A LARGE ROOM. A THICKRED LINE IS PAINTED JUST INSIDE THE DOORWAY. "
9110 DATA "NSEW","THE ROOM IS FULL OF RUBBLE. A   NARROW PATHS HAVE BEEN CLEARED. "
9120 DATA "EW","YOU ARE ON A DARK PATH. "
9130 DATA "EW","YOU ARE ON AN OLD WORN PATH. "
9140 DATA "EW","YOU ARE IN A ROOM PACKED WITH   PLANTS FROM FLOOR TO CEILING. "
9150 DATA "NSW","YOU ARE IN A DIMLY LIT CORRIDOR."
9160 DATA "E","YOU ARE IN A TRIANGULAR ROOM. "
9170 DATA "NW","YOU ARE IN A CURVING PASSAGEWAY.THE SLOPE IS VERY STEEP. "
9180 DATA "NSEW","VOID. "
9190 DATA "N","YOU ARE IN TRIANGULAR ROOM. A   STONE CUBE STANDS IN THE CENTRE."
9200 DATA "NSEW","VOID. "
9210 DATA "E","YOU ARE IN TILED CIRCULAR ROOM. "
9220 DATA "NWE","EMPTY DENTED AND SCRATCHED METALSHELVES FILL THE ROOM. "
9230 DATA "WE","YOU ARE IN A STORAGE AREA FULL  OF EMPTY CRATES. "
9240 DATA "W","YOU ARE IN A DOCK. THE CRYSTAL  HAS GONE AND THE SUBMARINE IS   INACTIVE. "
9250 DATA "S","YOU ARE INSIDE THE SUBMARINE. A COMPLEX PANEL HAS AN ANGULAR    SLOT. "
9260 DATA "NSEW","VOID. "
9270 DATA "NSEW","VOID. "
9280 DATA "SE","YOU ARE IN A CLEARING ON THE    EDGE OF THE TROPICAL FOREST. "
9290 DATA "SW","THROUGH THE THICK UNDERGROWTH   YOU SEE A RED STURDY METALLIC   DOOR TO THE EAST. "
9300 DATA "EW","YOU ARE IN A FEATURELESS GREY   ROOM. "
9310 DATA "EW","YOU ARE IN A CORRIDOR. YOUR     FOOTSTEPS ECHO LOUDLY. "
9320 DATA "EW","YOU ARE IN A CORRIDOR. IN THE   DISTANCE YOU HEAR THE SOUND OF  WATER. "
9330 DATA "NW","YOU ARE IN A SMALL DOCK AREA. TOTHE NORTH A SMALL SUB-AQUATIC   VEHICLE FLOATS ON THE WATER. "
9340 DATA "NSEW","VOID. "
9350 DATA "NSEW","VOID. "
9360 DATA "NSE","YOU ARE IN A CLEARING ON THE    EDGE OF THE FOREST. "
9370 DATA "NSW","YOU ARE IN A CLEARING ON THE    EDGE OF THE FOREST. "
9380 DATA "SE","YOU ARE IN THE DEEP WATER. A    GLOWING GREEN BARRIER BLOCKS    YOUR PROGRESS AWAY FROM THE     ISLAND. "
9390 DATA "SEW","YOU ARE IN THE DEEP WATER. A    GLOWING GREEN BARRIER BLOCKS    YOUR PROGRESS AWAY FROM THE     ISLAND. "
9400 DATA "EW","YOU ARE IN THE DEEP WATER. A    GLOWING GREEN BARRIER BLOCKS    YOUR PROGRESS AWAY FROM THE     ISLAND. "
9410 DATA "SW","YOU ARE IN THE DEEP WATER. A    GLOWING GREEN BARRIER BLOCKS    YOUR PROGRESS AWAY FROM THE     ISLAND. "
9420 DATA "NSEW","VOID. "
9430 DATA "NSEW","VOID. "
9440 DATA "E","YOU ARE ON A CLIFF EDGE. THERE  IS A LEDGE BELOW. "
9450 DATA "NSW","YOU ARE IN THE FOREST. "
9460 DATA "NSE","YOU ARE IN THE DEEP WATER. A    GLOWING GREEN BARRIER BLOCKS    YOUR PROGRESS AWAY FROM THE     ISLAND. "
9470 DATA "NSW","YOU ARE IN THE DEEPER WATER. "
9480 DATA "S","YOU ARE IN THE CABIN. "
9490 DATA "NS","YOU ARE IN THE DEEP WATER. A    GLOWING GREEN BARRIER BLOCKS    YOUR PROGRESS AWAY FROM THE     ISLAND. "
9500 DATA "SE","A LARGE METAL ARCHWAY LEADS TO ARED ROCKY AREA. MANY STARS FILL THE NIGHT SKY. "
9510 DATA "SW","YOU ARE ON A CLIFFTOP. A        SWEEPING DESERT PLAIN STRETCHES OUT TO THE HORIZON. "
9520 DATA "E","YOU ARE ON A CLIFF EDGE. WAVES  SLOWLY CRASH ONTO THE SHARP     ROCKS BELOW. "
9530 DATA "NSW","YOU ARE IN THE FOREST. "
9540 DATA "NSE","YOU ARE IN THE SHALLOW WATER. "
9550 DATA "NSW","YOU ARE IN THE SHALLOW WATER. "
9560 DATA "NS","YOU ARE ON THE DECK. THE SHIP ISGROUNDED "
9570 DATA "S","YOU ARE IN THE DEEP WATER. A    GLOWING GREEN BARRIER BLOCKS    YOUR PROGRESS AWAY FROM THE     ISLAND. "
9580 DATA "N","YOU ARE IN A CHAMBER. THERE IS AFAINT HUM. A STRANGE ODOUR FILLSTHE THIN AIR. "
9590 DATA "N","YOU ARE IN A SMALL ROOM. THERE  ARE STAR CHARTS ON THE WALL. "
9600 DATA "E","YOU ARE ON A CLIFF EDGE. WAVES  SLOWLY CRASH ONTO THE SHARP     ROCKS BELOW. "
9610 DATA "NEW","YOU ARE IN THE FOREST. IT IS    VERY QUIET. A PATH LEADS EAST TOTHE BEACH. "
9620 DATA "NEW","YOU ARE IN THE DUNES. TO THE    WEST YOU CAN SEE A THICK FOREST."
9630 DATA "NEW","YOU ARE ON THE BEACH. TO THE    NORTH THE CALM WATER SPLASHES   AGAINST THE WHITE SAND. "
9640 DATA "NEW","YOU ARE ON A ROCKY OUTCROP. TO  THE WEST YOU CAN SEE A SANDY    BEACH AND TO THE WEST THE ROCKS CONTINUE. "
9650 DATA "W","YOU ARE ON A ROCKY OUTCROP. "
9700 REM objects
9710 DATA "STRAW","A PLASTIC STRAW.",46
9720 DATA "CIRCUIT","A SMALL GREEN L-SHAPED CIRCUIT.",27
9730 DATA "MACHETE","A WORN TOOL WITH A SHARP EDGE.",1
9740 DATA "HORSESHOE","A BATTERED HORSESHOE.",52
9750 DATA "ROPE","A LENGTH OF STRONG ROPE.",64
9760 DATA "CRYSTAL","A RED OCTOHEDRON CRYSTAL.",1
9770 DATA "TELESCOPE","METALLIC AND SURPRISINGLY LIGHT.",58
9780 DATA "STATUE","A WEATHERED MARBLE STATUE OF A  TALL WARRIOR WITH A TRIDENT.",35
9790 DATA "BRANCH","A THICK SMOOTH BIO-ILLUMINATING BLUE VINE.",13
9800 DATA "CUBE","A COLD SMOOTH STONE CUBE APPROX 2 FEET WIDE.",18
9810 DATA "FOUNTAIN","A DARK NARROW JAGGED STONE.     IT IS BONE DRY.",2
9820 DATA "LEVER","A THIN GOLD LEVER WITH A RED    STONE HANDLE.",9
9830 DATA "FLUTE","A CARVED ORNATE INSTRUMENT.",20
9840 DATA "CUBOID","A SMALL GREEN CUBOID MADE OF    SMOKEY GLASS. THERE ARE NO      MARKINGS.",15
9899 REM RETURN
9900 DATA 244,128,128,128,134,128,141,128,134,134,128,128,135,128,129,140,137,128,137,134,128,131,136,128,134,128,129,248,128,128,128,134
9901 DATA 128,128,128,134,128,128,134,128,128,134,128,134,128,241,134,128,132,128,128,137,242,128,128,132,128,128,134,134,128,137,140,128
9902 DATA 137,128,133,128,244,128,137,128,128,134,134,179,179,179,179,179,179,179,179,179,179,179,128,131,137,132,128,137,134,134,130,130
9903 DATA 128,137,138,128,132,131,128,248,128,137,183,191,188,188,188,188,188,188,188,188,188,191,187,128,128,137,134,128,128,134,130,128
9904 DATA 129,138,128,128,134,128,137,128,128,134,191,185,191,191,191,191,191,191,191,191,191,182,191,128,134,241,128,137,128,134,241,128
9905 DATA 128,137,128,137,130,241,128,137,131,136,191,181,191,191,223,223,223,223,223,191,191,186,191,128,134,128,128,132,132,132,130,134
9906 DATA 129,128,128,128,139,128,128,134,128,130,191,181,191,223,223,223,223,223,223,223,191,186,191,134,133,134,132,130,128,137,128,128
9907 DATA 248,137,129,248,133,128,128,134,128,128,191,181,191,223,223,223,223,223,223,223,191,186,191,128,137,128,133,132,140,132,134,128
9908 DATA 128,128,137,131,138,134,128,137,128,142,191,181,191,191,223,223,223,223,223,191,191,186,191,137,130,137,134,128,241,128,137,134
9909 DATA 128,128,129,134,133,128,128,134,133,131,191,181,191,191,191,191,191,191,191,191,191,186,191,128,136,128,128,128,137,134,137,137
9910 DATA 242,128,136,132,138,134,128,137,135,128,191,181,191,188,188,188,188,188,188,188,191,186,191,128,242,137,241,128,128,132,131,128
9911 DATA 128,137,128,129,141,130,128,134,128,130,191,181,191,188,188,188,188,188,188,188,191,186,191,137,134,134,133,134,241,132,128,136
9912 DATA 129,136,137,128,244,128,134,128,134,128,191,181,191,188,188,188,188,188,188,188,191,186,191,128,137,134,134,128,134,134,128,134
9913 DATA 128,128,128,137,134,137,136,134,128,128,191,181,191,191,191,191,191,191,191,191,191,186,191,130,137,134,130,142,128,137,134,128
9920 RETURN
9921 DATA 193,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,193
9922 DATA 128,128,128,128,128,128,128,128,128,128,128,128,193,128,128,128,128,128,128,128,193,128,128,128,128,128,128,128,193,128,128,128
9923 DATA 159,146,128,128,128,128,193,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
9924 DATA 159,159,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,193,128,128,128,128,128,128,128
9925 DATA 159,159,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,193,128,128,128,128,128,128,128,128,128,128,128,128,128,128
9926 DATA 159,159,128,128,128,128,128,128,128,128,128,193,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
9927 DATA 159,159,128,128,128,128,193,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,193,128,128,128,128
9928 DATA 159,159,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,193,128,128,128,128,128,193,128,128,128,128,128,128,128,128
9929 DATA 191,159,146,128,128,128,128,128,128,128,128,193,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
9930 DATA 191,191,191,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,209,223,223,223,210,128,128
9931 DATA 191,191,191,191,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,223,153,153,153,223,128,128
9932 DATA 191,191,191,191,191,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,223,153,153,153,223,128,128
9933 DATA 191,191,191,191,191,191,191,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,223,153,153,153,223,128,128
9934 DATA 191,191,191,191,191,191,191,191,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,223,153,153,153,223,175,175
9935 DATA 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,153,153,153,223,255,255
9936 DATA 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
9937 REM END OF PROGRAM

9998 REM EXIT
9999 REM END
