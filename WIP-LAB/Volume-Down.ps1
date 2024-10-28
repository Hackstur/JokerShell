$WScript = New-Object -com wscript.shell; 1..50 | % { $WScript.SendKeys([char]174) }; 
Exit