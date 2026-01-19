@echo off
echo msgbox "Vkluchil", 0, "Pecen" > %temp%\p.vbs
cscript //nologo %temp%\p.vbs
del %temp%\p.vbs