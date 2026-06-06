# genkaiki-infra

Infrastructure as Code for Genkaiki organization services.

## Services

| Service | Path | Port | Subdomain | Purpose |
|---------|------|------|-----------|---------|
| Nginx | `nginx/` | 80 | — | Reverse proxy |
| Penpot | `penpot/` | 9001 | `penpot.localhost` | Self-hosted design tool |
| SonarQube | `sonarqube/` | 9000 | `sonarqube.localhost` | Code quality & security analysis |

## Usage

Each service has its own directory with a `docker-compose.yaml` and `.env.example`.

```bash
# 1. Criar rede compartilhada (apenas uma vez)
docker network create genkaiki-proxy

# 2. Nginx (reverse proxy)
docker compose -f nginx/docker-compose.yaml up -d

# 3. Penpot → http://penpot.localhost
cp penpot/.env.example penpot/.env
docker compose -f penpot/docker-compose.yaml up -d
docker compose -f penpot/docker-compose.yaml logs cloudflared  # URL externa

# 4. SonarQube → http://sonarqube.localhost
cp sonarqube/.env.example sonarqube/.env
docker compose -f sonarqube/docker-compose.yaml up -d
docker compose -f sonarqube/docker-compose.yaml logs cloudflared  # URL externa
# Default login: admin / admin (trocar no primeiro acesso)
```

> **Note:** SonarQube requer `vm.max_map_count=524288` em Linux.
> No Docker Desktop (Windows/Mac) é configurado automaticamente.

## Adding a new service

1. Create `service-name/` directory
2. Add `docker-compose.yaml` and `.env.example`
3. Document in this README
