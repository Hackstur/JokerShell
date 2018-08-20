<#
.SYNOPSIS
  Minimum Volume Down
.DESCRIPTION
  Emulate press the "VolumeDown" Key to set the speakers to minimum volume.
.NOTES
  Version:        1.0
  Author:         Hacksturcon (G.R.G)
  Creation Date:  19/08/2018
.EXAMPLE
  Just run the script.
#>
$WScript = New-Object -com wscript.shell; 1..50 | % { $WScript.SendKeys([char]174) }; 
Exit
