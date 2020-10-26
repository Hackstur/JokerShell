$timer = New-Object System.Timers.Timer
$timer.AutoReset = $true #resets itself
$timer.Interval = 1000 #ms
$initial_time = Get-Date
$end_time = $initial_time.AddSeconds(12) ## don't know why, but it needs 2 more seconds to show right

# create windows script host
$wshell = New-Object -ComObject Wscript.Shell
# add end_time variable so it's accessible from within the job
$wshell | Add-Member -MemberType NoteProperty -Name endTime -Value $end_time

Register-ObjectEvent -SourceIdentifier "PopUp Timer" -InputObject $timer -EventName Elapsed -Action {
    $endTime = [DateTime]$event.MessageData.endTime
    $time_left = $endTime.Subtract((Get-Date)).Seconds

    if($time_left -le 0){
        $timer.Stop()
        Stop-Job -Name * -ErrorAction SilentlyContinue
        Remove-Job -Name * -ErrorAction SilentlyContinue
        #other code
        # logoff user?
    }
    $event.MessageData.Popup("Your PC will be shutdown in $time_left sec",1,"Message Box Title",64)
} -MessageData $wshell

$timer.Start()