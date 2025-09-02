# Resetar terminal
Clear-Host

# Rodar flutter test
Write-Host "Rodando testes com Flutter..." -ForegroundColor Cyan
flutter test

# Verificar status dos testes
if ($LASTEXITCODE -eq 0) {
    Clear-Host
    Write-Host "==================================" -ForegroundColor DarkGreen
    Write-Host "    TODOS OS TESTES PASSARAM! " -ForegroundColor Green
    Write-Host "==================================" -ForegroundColor DarkGreen

    # Pedir mensagem do commit
    Write-Host ""
    $commitMessage = Read-Host "Digite a mensagem do commit"

    # Fazer commit
    git add .
    git commit -m "$commitMessage"
    git push origin main

    $width = 40
    function CenterText($text, $width) {
        $padding = [Math]::Max(0, ($width - $text.Length) / 2)
        return (" " * [Math]::Floor($padding)) + $text
    }

    Clear-Host
    Write-Host ("=" * $width) -ForegroundColor DarkCyan
    Write-Host (CenterText "Commit enviado com sucesso!" $width) -ForegroundColor Cyan
    Write-Host ""
    Write-Host (CenterText "Mensagem" $width) -ForegroundColor Yellow
    Write-Host (CenterText $commitMessage $width) -ForegroundColor White
    Write-Host ("=" * $width) -ForegroundColor DarkCyan
}
else {
    Write-Host "==================================" -ForegroundColor DarkRed
    Write-Host "  Testes falharam. Commit cancelado. " -ForegroundColor Red
    Write-Host "==================================" -ForegroundColor DarkRed
}