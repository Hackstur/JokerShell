#requires -version 2
<#
.SYNOPSIS
  Change windows wallpaper from internet image.
.DESCRIPTION
  The image are stored at %UserProfile% folder with a GUID by name, change the desktop-wallpaper registry key and
  update the user profile.
  
  There is a reason to add multiple profile update commands: Windows doesnt update the profile all times.
  If you wait a little, the updating command will work, but if you are updated the profile recently its better repeat a few times.
.NOTES
  Version:        1.0
  Author:         Hacksturcon (G.R.G)
  Creation Date:  19/08/2018
.EXAMPLE
  Just run the script.
#>
$ImageFileName = "wallpaper_carmencita.jpg"
$File = "$($env:USERPROFILE)\"+[guid]::NewGuid().ToString()+".jpg"
$ImageUrl = "http://zonadenoticias.com/wp-content/uploads/2013/06/20100928094106_mairenag.jpg"
Invoke-WebRequest -UseBasicParsing -Uri $ImageUrl -OutFile "$File"
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value "$File"
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters, 0, True
rundll32.exe user32.dll, UpdatePerUserSystemParameters, 1, True
rundll32.exe user32.dll, UpdatePerUserSystemParameters, 2, True
rundll32.exe user32.dll, UpdatePerUserSystemParameters, 2, True
rundll32.exe user32.dll, UpdatePerUserSystemParameters, 1, True
rundll32.exe user32.dll, UpdatePerUserSystemParameters, 0, True
rundll32.exe user32.dll, UpdatePerUserSystemParameters
exit

