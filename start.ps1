$root = $PSScriptRoot
$env_file = "$root\cloudflared\.env"

Write-Host "Starting genkaiki-infra..." -ForegroundColor Cyan
docker compose -f "$root\docker-compose.yaml" --env-file $env_file up -d

Write-Host ""
Write-Host "All services up!" -ForegroundColor Green
Write-Host "  Penpot     -> http://penpot.localhost"
Write-Host "  SonarQube  -> http://sonarqube.localhost"
