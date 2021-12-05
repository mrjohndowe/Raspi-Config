$file = "D:\SteamLibrary\steamapps\common\Farming Simulator 22\data\sounds\soundTemplates.xml"
$increaseby = 8

if(-not (Test-Path "$file.bak")) {
    Copy-Item $file "$file.bak"
}

[xml]$template = Get-Content $file

$template | Select-Xml -XPath '//volume' | ForEach-Object {
    $_.node.indoor = ([decimal]($_.node.indoor)+$increaseby).ToString().Replace(",",".")
    $_.node.outdoor = ([decimal]($_.node.outdoor)+$increaseby).ToString().Replace(",",".")
}

$template.Save($file)