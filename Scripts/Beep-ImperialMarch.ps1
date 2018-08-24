Function Bp($freq,$time){ [console]::beep($freq, $time) }
Function Slp($time){ Start-Sleep -m $time }  
<#
.SYNOPSIS
  Star-Wars "Imperial March" with beeps.
.DESCRIPTION
  Plays Star-Wars "Imperial March" with system Beeps & Pauses.

  This Script is Part of Powershell-Pranks project.
.NOTES
  Version:        1.0
  Author:         Hackstur (G.R.G.)
  Creation Date:  19/08/2018
.LINK
  https://github.com/Hackstur/PowerShell-Pranks
.EXAMPLE
  Just run the script.
#>
Bp 440 500
Bp 440 500
Bp 440 500
Bp 349 350
Bp 523 150
Bp 440 500
Bp 349 350
Bp 523 150
Bp 440 900
Bp 640 500
Bp 640 500
Bp 640 500
Bp 698 350
Bp 523 150
Bp 415 500
Bp 349 350
Bp 523 150
Bp 440 900
Bp 880 500
Bp 880 545
Bp 440 409
Bp 440 136
Bp 880 545
Bp 831 273
Bp 784 273
Bp 740 125
Bp 700 225
Bp 455 250
Bp 590 700
Exit
