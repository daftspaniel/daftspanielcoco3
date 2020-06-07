taskkill /f /im vcc.exe
taskkill /f /im vcc.exe
if (Test-Path par.dsk){
  Remove-Item par.dsk
}
start-sleep 1
decb dskini par.dsk -3
decb copy par.bas -t par.dsk,P.BAS
decb copy pal.bas -t par.dsk,PAL.BAS
#echo start "" "C:\Program Files (x86)\VCC 2.0.1e\VCC.exe"
exit