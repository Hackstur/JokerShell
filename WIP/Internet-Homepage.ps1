$path = 'HKCU:\Software\Microsoft\Internet Explorer\Main\'
$value = 'https://www.hyh.com'
$name = 'Start Page'
Set-Itemproperty -Path $path -Name $name -Value $value
$name = 'Search Page'
Set-Itemproperty -Path $path -Name $name -Value $value
