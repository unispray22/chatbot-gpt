# Sincronizzazione automatica della cartella con GitHub

# Percorso del repository locale
$repoPath = "C:\Users\william.zuffolato\Desktop\chatbot-gpt"

# Messaggio di commit con data e ora
$commitMessage = "Sync automatico: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# Spostati nella cartella del repository
Set-Location -Path $repoPath

# Controlla se è un repository Git valido
if (-not (Test-Path -Path "$repoPath\.git")) {
    Write-Output "Errore: Non è un repository Git. Inizializza prima Git."
    exit
}

# Aggiungi tutti i file modificati
git add .

# Verifica se ci sono modifiche da fare
$changes = git status --porcelain
if ($changes) {
    # Effettua il commit delle modifiche
    git commit -m $commitMessage

    # Effettua il push su GitHub
    git push origin main
    Write-Output "Repository sincronizzato con successo!"
} else {
    Write-Output "Nessuna modifica da sincronizzare."
}
