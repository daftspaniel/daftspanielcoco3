10CLS:X=40
20?@X,"*";:?@X-32," ";:FORD=1TO100:NEXT
40IFX<480 AND PEEK(1056+X)<>106 THENX=X+32 ELSE F=X:X=40+RND(20):GOSUB2000
50GOTO20
1000A$=INKEY$:IFA$=""THEN1000
1001END
2000IF PEEK(1023+F)=106 AND PEEK(1025+F)=106 THEN SOUND255,1
2400RETURN
