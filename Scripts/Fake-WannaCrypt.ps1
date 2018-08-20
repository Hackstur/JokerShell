<#
.SYNOPSIS
  Fake WannaCrypt prank (Win10)
.DESCRIPTION
  Required:   Internet Connection

  Start fake WannaCrypt website in fullscreen mode usin IE
.NOTES
  Version:        1.0
  Author:         Hacksturcon
  Creation Date:  19/08/2018
.EXAMPLE
  Just run the script.
#>
Start-Process iexplore -ArgumentList "-k http://fakeupdate.net/wnc/"
exit