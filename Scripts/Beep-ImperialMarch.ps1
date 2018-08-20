Function Bp($freq,$time){ [console]::beep($freq, $time) }
Function Slp($time){ Start-Sleep -m $time }  
<#
.SYNOPSIS
  Star-Wars "Imperial March" with system beeps.
.DESCRIPTION
  Star-Wars "Imperial March" with system beeps.
.NOTES
  Version:        1.0
  Author:         Hackstur G.R.G
  Creation Date:  19/08/2018
.EXAMPLE
  Just run the script.

  Or use the functions for make your own:
  BpFrequency  Milliseconds for play "Beep"
  SlpMilliseconds for "Sleep" the script
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
Bp 523 1300
Bp 659 500
Bp 659 500
Bp 659 500
Bp 698 350
Bp 523 150
Bp 415 500
Bp 349 350
Bp 523 150
Bp 440 900
Bp 523 1300
Bp 880 500
Bp 880  545
Bp 440  409
Bp 440  136
Bp 880  545
Bp 831  273
Bp 784  273
Bp 740 125
Bp 700 225
Bp 455 250
Bp 590 700
Bp 831  273
Bp 784  273
Bp 740 125
Bp 700 225
Bp 455 250
Bp 590 700 #until here it is tolerable 
Bp 590 700
Exit
