Start-Process iexplore -ArgumentList '-k https://fakeupdate.net/vista/' -PassThru | ForEach-Object { Start-Sleep -Seconds 2; Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait("{F11}") }
