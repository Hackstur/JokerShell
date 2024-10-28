for ($i = 0; $i -lt 10; $i++) {
    Start-Process "msedge.exe" -ArgumentList "--new-window https://www.google.com"
}