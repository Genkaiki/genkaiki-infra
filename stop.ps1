$root = $PSScriptRoot

Write-Host "Stopping genkaiki-infra..." -ForegroundColor Yellow
docker compose -f "$root\docker-compose.yaml" down

Write-Host "Done." -ForegroundColor Green
