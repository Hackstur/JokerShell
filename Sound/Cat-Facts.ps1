function Get-Data {
    param (
        [string]$Uri
    )
    # Realiza la solicitud a la URL especificada y devuelve el contenido
    $ResponseJson = Invoke-WebRequest -Uri $Uri -Method Get
    return (ConvertFrom-Json $ResponseJson.Content)
}

function Translate($Text, $TargetLanguage) {
    # Realiza una solicitud a la API de Google Translate para traducir el texto
    $Uri = "https://clients5.google.com/translate_a/t?client=dict-chrome-ex&sl=auto&tl=$TargetLanguage&q=$Text"
    $RawResponse = (Invoke-WebRequest -Uri $Uri -Method Get).Content

    # Intenta convertir la respuesta a JSON y capturar el texto traducido
    try {
        $ParsedResponse = $RawResponse | ConvertFrom-Json
        $TranslatedText = $ParsedResponse[0][0]
        return $TranslatedText
    } catch {
        Write-Host "Error al traducir el texto."
        return ""
    }
}

# Inicializar el sintetizador de voz
Add-Type -AssemblyName System.Speech
$SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer

# Especificar la URL y la clave para obtener datos (modifica aquí)
$DataUrl = 'https://catfact.ninja/fact?max_length=140' 

# Obtiene los datos de la URL especificada
$Data = Get-Data -Uri $DataUrl

# Dependiendo de la estructura JSON, obtenemos el texto adecuado
if ($Data -is [PSCustomObject]) {
    $Text = if ($Data.PSObject.Properties["fact"]) { $Data.fact } else { $Data.value }
} else {
    Write-Host "Error: La respuesta no es un objeto JSON válido."
    exit
}

# Traducir el texto
$TextES = Translate -Text $Text -TargetLanguage "es"

# Reproduce el texto en español
$SpeechSynth.Speak("¿Sabías que?")
$SpeechSynth.Speak($TextES)

# Muestra el texto traducido en la consola para confirmación
Write-Host "Texto traducido: $TextES"
