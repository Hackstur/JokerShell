#Requires -Version 1
<#
.SYNOPSIS
  Returns a Base64 string from file path
.DESCRIPTION
  The script will return a plain Base64 string from input file.
  Parameter $1=Source File Path
  Parameter > $2=Piped output File
.NOTES
  Version:        1.0
  Author:         Hacksturcon (G.R.G)
  Creation Date:  19/08/2018
.EXAMPLE
  ./Convert-ToBase64String.ps1 file.jpg > file.txt
#>
Param([String]$path)
[convert]::ToBase64String((get-content $path -encoding byte))