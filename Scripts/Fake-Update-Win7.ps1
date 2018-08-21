<#
.SYNOPSIS
  Fake Update prank (Win7)
.DESCRIPTION
  Start fake Windows 7 update website in fullscreen mode usin IE.

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
Start-Process iexplore -ArgumentList "-k http://fakeupdate.net/win7/"
exit