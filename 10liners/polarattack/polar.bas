1 DIMX,S,A$(3),U$(3),P$(3),V$:V$=CHR$(128):U$(1)=STRING$(5,207)+V$:U$(2)=STRING$(4,207)+V$:U$(3)=CHR$(207)+V$+V$+CHR$(207)+V$:A$(1)=CHR$(170):A$(2)=CHR$(169):A$(3)=CHR$(172):P$(1)="READY":P$(2)="AIM":P$(3)="FIRE":K$="press"+V$:W=0:L=0
2 X=90-RND(15):A=0:S=0:R=0:CLS0:?@489,"kills"+STR$(W)+V$+"loses"+STR$(L);:?@64,CHR$(239);:?@96,CHR$(223);
3 ?@128,CHR$(251);:?@10,"polar"+V$+"attack";:R$=STRING$(32,148):?@192,R$;:?@352,R$;
4 ?@263,"wait"+V$+"for"+V$+"it"+V$+"sheriff";:FORD=1TO999+RND(255)*8:NEXT:?@263,V$+V$+"bear"+V$+"attacking"+V$+V$+V$+V$+V$+V$+V$;
5 IFS>3THENSOUND50,12:SOUND99,4:?@X+65,U$(1)+STRING$(34,128);:GOTO10
6 IF S=0 OR PEEK(&H87)=R THEN SOUND99,1:S=S+1:R=65+RND(25):IFS<4THEN?@&H128,K$+CHR$(R)+V$+"to"+V$+P$(S)+V$+V$+V$+V$;:?@97,A$(S);
7 ?@X,U$(&H1);:?@X+&H21,U$(&H2);:?@X+&H41,U$(&H3);:IFS>3THEN?@98,STRING$(4,184);:GOTO5
8 A=RND(R):X=X-1:IF X > &H40 THENSOUND&H32+(&H32-X),1:GOTO5
9 L=L+1:SOUND255,4:FORD=42TO1STEP-1:CLS5:CLS4:SOUNDD,1:NEXT:GOTO2
10 W=W+1:?@263,"you"+V$+"got"+V$+"it"+V$+"sheriff"+V$+V$;:?@295,STRING$(32,128);:?@X+65,U$(1)+V$;:?@X+33,STRING$(4,207)+V$;:?@X,CHR$(207)+V$+V$+CHR$(207)+V$;:?@65,STRING$(10,128);:FORD=1TO3000:NEXT:GOTO2
