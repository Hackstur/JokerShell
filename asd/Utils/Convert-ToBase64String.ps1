# Written by Hacksturcon https://github.com/Hacksturcon/Fun-PowerShell 
# ---
# Encoding imput file to output bynary string text file
# .\FileToBase64.ps1 fileimput.jpg >> fileoutput.txt
# ---
Param([String]$path)
[convert]::ToBase64String((get-content $path -encoding byte))