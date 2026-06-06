$root = $PSScriptRoot

Write-Host "Creating shared network..." -ForegroundColor Cyan
docker network create genkaiki-proxy 2>$null

Write-Host "Starting Nginx..." -ForegroundColor Cyan
docker compose -f "$root\nginx\docker-compose.yaml" up -d

Write-Host "Starting Penpot..." -ForegroundColor Cyan
docker compose -f "$root\penpot\docker-compose.yaml" up -d

Write-Host "Starting SonarQube..." -ForegroundColor Cyan
docker compose -f "$root\sonarqube\docker-compose.yaml" up -d

Write-Host "Starting Cloudflare Tunnel..." -ForegroundColor Cyan
docker compose -f "$root\cloudflared\docker-compose.yaml" --env-file "$root\cloudflared\.env" up -d

Write-Host ""
Write-Host "All services up!" -ForegroundColor Green
Write-Host "  Penpot     -> http://penpot.localhost"
Write-Host "  SonarQube  -> http://sonarqube.localhost"
