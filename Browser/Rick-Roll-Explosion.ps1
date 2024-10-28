for ($i = 0; $i -lt 10; $i++) { 
    $WScript = New-Object -com wscript.shell; 1..50 | % { $WScript.SendKeys([char]175) }; 
    Start-Process "msedge.exe" -ArgumentList '--new-window https://player.vimeo.com/video/375468729' | ForEach-Object { Start-Sleep -Seconds 2; Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait("{F11}"); Start-Sleep -Milliseconds 500; [System.Windows.Forms.SendKeys]::SendWait(" ") } 
}
