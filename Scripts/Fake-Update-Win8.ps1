<#
.SYNOPSIS
  Fake Update prank (Win8)
.DESCRIPTION
  Required:   Internet Connection

  Start fake Windows 8 update website in fullscreen mode usin IE
.NOTES
  Version:        1.0
  Author:         Hackstur
  Creation Date:  19/08/2018
.EXAMPLE
  Just run the script.
#>
Start-Process iexplore -ArgumentList "-k http://fakeupdate.net/win8/"
exit