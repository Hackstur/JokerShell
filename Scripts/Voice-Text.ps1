<#
.SYNOPSIS
  Speak text using text-to-speech windows utility
.DESCRIPTION
  Not more complicated. The computer will speak the text in the script.
.NOTES
  Version:        1.0
  Author:         Hacksturcon (G.R.G)
  Creation Date:  19/08/2018
.EXAMPLE
  Just run the script.
#>
Add-Type -AssemblyName System.speech
$TTS = New-Object System.Speech.Synthesis.SpeechSynthesizer
$TTS.Speak('Ja ge Ji Jo jhu. You have been Powned!')
exit
