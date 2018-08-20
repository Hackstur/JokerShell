<#
.SYNOPSIS
  Maximum Volume Up
.DESCRIPTION
  Emulate press the "VolumeUp" Key to set the speakers to maximum volume.
.NOTES
  Version:        1.0
  Author:         Hackstur (G.R.G)
  Creation Date:  19/08/2018
.EXAMPLE
  Just run the script.
#>
$WScript = New-Object -com wscript.shell; 1..50 | % { $WScript.SendKeys([char]175) }; 
Exit