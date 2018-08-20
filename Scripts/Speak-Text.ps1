Function Speak-Text($Text) { Add-Type -AssemblyName System.speech; $TTS = New-Object System.Speech.Synthesis.SpeechSynthesizer; $TTS.Speak($Text) }
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
  Speak-Text "text to speak"
#>
Speak-Text "Ja ge Ji Jo jhu. You have been Powned"
Exit
