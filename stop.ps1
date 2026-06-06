$root = $PSScriptRoot

Write-Host "Stopping all services..." -ForegroundColor Yellow

docker compose -f "$root\cloudflared\docker-compose.yaml" down
docker compose -f "$root\sonarqube\docker-compose.yaml" down
docker compose -f "$root\penpot\docker-compose.yaml" down
docker compose -f "$root\nginx\docker-compose.yaml" down

Write-Host "Done." -ForegroundColor Green
