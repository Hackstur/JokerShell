<#
.SYNOPSIS
  Fake Install prank (Win10)
.DESCRIPTION
  Required:   Internet Connection

  Start fake Windows 10 install website in fullscreen mode usin IE
.NOTES
  Version:        1.0
  Author:         Hackstur
  Creation Date:  19/08/2018
.EXAMPLE
  Just run the script.
#>
Start-Process iexplore -ArgumentList "-k http://fakeupdate.net/win10/"
exit