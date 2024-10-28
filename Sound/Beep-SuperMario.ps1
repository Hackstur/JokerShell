
$BeepList = @(
    @{ Pitch = 659; Length = 125 }, @{ Pitch = 659; Length = 125 }, @{ Pitch = 0; Length = 125 },
    @{ Pitch = 659; Length = 125 }, @{ Pitch = 0; Length = 167 }, @{ Pitch = 523; Length = 125 },
    @{ Pitch = 659; Length = 125 }, @{ Pitch = 0; Length = 125 }, @{ Pitch = 784; Length = 125 },
    @{ Pitch = 0; Length = 375 }, @{ Pitch = 392; Length = 125 }, @{ Pitch = 0; Length = 375 },
        
    @{ Pitch = 523; Length = 125 }, @{ Pitch = 0; Length = 250 }, @{ Pitch = 392; Length = 125 },
    @{ Pitch = 0; Length = 250 }, @{ Pitch = 330; Length = 125 }, @{ Pitch = 0; Length = 250 },
    @{ Pitch = 440; Length = 125 }, @{ Pitch = 0; Length = 125 }, @{ Pitch = 494; Length = 125 },
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 466; Length = 125 }, @{ Pitch = 0; Length = 42 },
    @{ Pitch = 440; Length = 125 }, @{ Pitch = 0; Length = 125 }, @{ Pitch = 392; Length = 125 },
        
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 659; Length = 125 }, @{ Pitch = 0; Length = 125 },
    @{ Pitch = 784; Length = 125 }, @{ Pitch = 0; Length = 125 }, @{ Pitch = 880; Length = 125 },
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 698; Length = 125 }, @{ Pitch = 784; Length = 125 },
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 659; Length = 125 }, @{ Pitch = 0; Length = 125 },
        
    @{ Pitch = 523; Length = 125 }, @{ Pitch = 0; Length = 125 }, @{ Pitch = 587; Length = 125 },
    @{ Pitch = 494; Length = 125 }, @{ Pitch = 0; Length = 125 }, @{ Pitch = 523; Length = 125 },
    @{ Pitch = 0; Length = 250 }, @{ Pitch = 392; Length = 125 }, @{ Pitch = 0; Length = 250 },
    @{ Pitch = 330; Length = 125 }, @{ Pitch = 0; Length = 250 }, @{ Pitch = 440; Length = 125 },
        
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 494; Length = 125 }, @{ Pitch = 0; Length = 125 },
    @{ Pitch = 466; Length = 125 }, @{ Pitch = 0; Length = 42 }, @{ Pitch = 440; Length = 125 },
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 392; Length = 125 }, @{ Pitch = 0; Length = 125 },
    @{ Pitch = 659; Length = 125 }, @{ Pitch = 0; Length = 125 }, @{ Pitch = 784; Length = 125 },
        
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 880; Length = 125 }, @{ Pitch = 0; Length = 125 },
    @{ Pitch = 698; Length = 125 }, @{ Pitch = 784; Length = 125 }, @{ Pitch = 0; Length = 125 },
    @{ Pitch = 659; Length = 125 }, @{ Pitch = 0; Length = 125 }, @{ Pitch = 523; Length = 125 },
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 587; Length = 125 }, @{ Pitch = 494; Length = 125 },
        
    @{ Pitch = 0; Length = 375 }, @{ Pitch = 784; Length = 125 }, @{ Pitch = 740; Length = 125 },
    @{ Pitch = 698; Length = 125 }, @{ Pitch = 0; Length = 42 }, @{ Pitch = 622; Length = 125 },
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 659; Length = 125 }, @{ Pitch = 0; Length = 167 },
    @{ Pitch = 415; Length = 125 }, @{ Pitch = 440; Length = 125 }, @{ Pitch = 523; Length = 125 },
        
    @{ Pitch = 0; Length = 125 }, @{ Pitch = 440; Length = 125 }, @{ Pitch = 523; Length = 125 },
    @{ Pitch = 587; Length = 125 }, @{ Pitch = 0; Length = 250 }, @{ Pitch = 784; Length = 125 },
    @{ Pitch = 740; Length = 125 }, @{ Pitch = 698; Length = 125 }, @{ Pitch = 0; Length = 42 },
    @{ Pitch = 622; Length = 125 }, @{ Pitch = 0; Length = 125 }, @{ Pitch = 659; Length = 125 },
        
    @{ Pitch = 0; Length = 167 }, @{ Pitch = 698; Length = 125 }, @{ Pitch = 0; Length = 125 },
    @{ Pitch = 698; Length = 125 }, @{ Pitch = 698; Length = 125 }, @{ Pitch = 0; Length = 625 },
    @{ Pitch = 784; Length = 125 }, @{ Pitch = 740; Length = 125 }, @{ Pitch = 698; Length = 125 },
    @{ Pitch = 0; Length = 42 }, @{ Pitch = 622; Length = 125 }, @{ Pitch = 0; Length = 125 },
        
    @{ Pitch = 659; Length = 125 }, @{ Pitch = 0; Length = 167 }, @{ Pitch = 415; Length = 125 },
    @{ Pitch = 440; Length = 125 }, @{ Pitch = 523; Length = 125 }, @{ Pitch = 0; Length = 125 },
    @{ Pitch = 440; Length = 125 }, @{ Pitch = 523; Length = 125 }, @{ Pitch = 587; Length = 125 },
    @{ Pitch = 0; Length = 250 }, @{ Pitch = 622; Length = 125 }, @{ Pitch = 0; Length = 250 },
        
    @{ Pitch = 587; Length = 125 }, @{ Pitch = 0; Length = 250 }, @{ Pitch = 523; Length = 125 },
    @{ Pitch = 0; Length = 625 }
)

foreach ($Beep in $BeepList) {
    if ($Beep['Pitch'] -ne 0) {
        [System.Console]::Beep($Beep['Pitch'], $Beep['Length'])
    } else {
        Start-Sleep -Milliseconds $Beep['Length']
    }
}

