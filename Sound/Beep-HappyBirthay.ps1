$WScript = New-Object -com wscript.shell; 1..50 | % { $WScript.SendKeys([char]175) }; 
$BeepList = @(
@{ Pitch = 1059.274; Length = 300; };
@{ Pitch = 1059.274; Length = 200; };
@{ Pitch = 1188.995; Length = 500; };
@{ Pitch = 1059.274; Length = 500; };
@{ Pitch = 1413.961; Length = 500; };
@{ Pitch = 1334.601; Length = 950; };

@{ Pitch = 1059.274; Length = 300; };
@{ Pitch = 1059.274; Length = 200; };
@{ Pitch = 1188.995; Length = 500; };
@{ Pitch = 1059.274; Length = 500; };
@{ Pitch = 1587.117; Length = 500; };
@{ Pitch = 1413.961; Length = 950; };

@{ Pitch = 1059.274; Length = 300; };
@{ Pitch = 1059.274; Length = 200; };
@{ Pitch = 2118.547; Length = 500; };
@{ Pitch = 1781.479; Length = 500; };
@{ Pitch = 1413.961; Length = 500; };
@{ Pitch = 1334.601; Length = 500; };
@{ Pitch = 1188.995; Length = 500; };
@{ Pitch = 1887.411; Length = 300; };
@{ Pitch = 1887.411; Length = 200; };
@{ Pitch = 1781.479; Length = 500; };
@{ Pitch = 1413.961; Length = 500; };
@{ Pitch = 1587.117; Length = 500; };
@{ Pitch = 1413.961; Length = 900; };
);

foreach ($Beep in $BeepList) {
    [System.Console]::Beep($Beep['Pitch'], $Beep['Length']);
}