$WScript = New-Object -ComObject WScript.Shell
Start-Sleep -Milliseconds 500 # Breve espera para asegurarse de que la ventana esté enfocada
$WScript.SendKeys("^{%}{LEFT}")
