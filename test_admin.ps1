# Test de verificacion HTTP de admin.html
$resp = Invoke-WebRequest -Uri "http://localhost:5500/admin.html" -UseBasicParsing
$body = $resp.Content

Write-Host "=== TEST AUTOMATIZADO DE ADMIN.HTML VIA HTTP ==="
Write-Host "Status Code:" $resp.StatusCode
Write-Host "Tamano:" $body.Length "bytes"

$t1 = $body.Contains('id="pinLockModal"')
$t2 = $body.Contains('id="btnUnlockPanel"')
$t3 = $body.Contains('quickUnlock()')
$t4 = $body.Contains('https://jsymymfchgqadrycchkb.supabase.co')
$t5 = $body.Contains('SafeStorage')

Write-Host "1. Estructura de Modal de PIN: $t1"
Write-Host "2. Boton de Desbloqueo (btnUnlockPanel): $t2"
Write-Host "3. Acceso Rapido (quickUnlock): $t3"
Write-Host "4. URL Oficial Supabase: $t4"
Write-Host "5. Almacenamiento Seguro (SafeStorage): $t5"

if ($t1 -and $t2 -and $t3 -and $t4 -and $t5) {
    Write-Host "========================================="
    Write-Host ">>> TODOS LOS TESTS PASARON (100% OK) <<<"
    Write-Host "========================================="
} else {
    Write-Host ">>> FALLO ALGUN TEST <<<"
}
