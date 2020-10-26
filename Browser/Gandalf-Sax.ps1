$WScript = New-Object -com wscript.shell; 1..50 | % { $WScript.SendKeys([char]175) }; 
Start-Process iexplore -ArgumentList "-k https://player.vimeo.com/video/198392879?autoplay=1"