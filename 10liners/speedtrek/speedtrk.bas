10 CLEAR300:R=8:V$=CHR$(128):DIMM(3,3),B(3):DIMT$(3),O$(3),M$(3):M(1,1)=2:M(1,2)=1:M(1,3)=3:M(2,1)=2:M(2,2)=3:M(2,3)=1:M(3,1)=1:M(3,2)=2:M(3,3)=3:B$=STRING$(32,128):O$(1)="mission"+V$+"successful":O$(2)="those"+V$+"orders"+V$+"were"+V$+"illogical"
11 B(1)=5:B(2)=0:B(3)=-5:DIMA$(3):A$(1)="you"+V$+"try"+V$+"diplomacy":A$(2)="you"+V$+"fire"+V$+"all"+V$+"phasers":A$(3)="you"+V$+"send"+V$+"a"+V$+"science"+V$+"team"
12 O$(3)="mission"+V$+"failed":M$(1)="T20AABAABAACAADAAEAAFGG":M$(2)="T40GFEDCBAO2GFEDCBA":M$(3)="T50O4GFEDCBA":T$(1)="was"+V$+"unpopulated":T$(2)="has"+V$+"peaceful"+V$+"people":T$(3)="attacked"+V$+"your"+V$+"ship":D=1000+RND(256):CLS0:
20 D=D+1:P=255-RND(7)*16:?@0,"stardate"+STR$(D);: ?@21,"rating"+STR$(R);:?@246,STRING$(6,P);:?@212,STRING$(10,P);:?@180,STRING$(10,P);:?@150,STRING$(6,P);
40 ?@128,STRING$(6,207);:?@163,CHR$(197);:?@195,STRING$(7,207)+CHR$(206);:?@170,CHR$(207);:?@136,STRING$(7,195);:?@138,STRING$(2,207);:?@352,STRING$(32,156);
60 ?@304,"planet"+V$+STR$(RND(12345)+19999);: ?@384,"1diplomacy2phasers3explore"+V$;:INPUTC:?@384,STRING$(64,128);
80 P=RND(3):O=M(C,P):R=R+B(O):?@384,A$(C);:?@416,"the"+V$+"planet"+V$ + T$(P);
85 ?@448,O$(O);:PLAYM$(O):FORD=1TO3000:NEXT
99 ?@384,STRING$(96,128);:IFR<1THEN?@21,"rating"+STR$(R);:?@390,"starfleet"+V$+"demote"+V$+"you";:?@459,"game"+V$+"over";:PLAY"T2GFEDCBAGFEDCBABA":RUN
100 IFR<20THEN ?@27,V$+V$+V$+V$;:GOTO20 ELSE ?@21,"rating"+STR$(R);:?@384,"starfleet"+V$+"promote"+V$+"you"+V$+"to"+V$+"admiral";:?@459,"well"+V$+"done";:PLAY"T2BAABEEBAABEFGBEDFG":RUN
