# genkaiki-infra

Infrastructure as Code for Genkaiki organization services.

## Services

| Service | Path | Port | Subdomain | Purpose |
|---------|------|------|-----------|---------|
| Nginx | `nginx/` | 80 | — | Reverse proxy |
| Cloudflared | `cloudflared/` | — | configurado no dashboard | Tunnel externo |
| Penpot | `penpot/` | 9001 | `penpot.localhost` | Self-hosted design tool |
| SonarQube | `sonarqube/` | 9000 | `sonarqube.localhost` | Code quality & security analysis |

## Usage

Each service has its own directory with a `docker-compose.yaml` and `.env.example`.

```bash
# 1. Criar rede compartilhada (apenas uma vez)
docker network create genkaiki-proxy

# 2. Nginx
docker compose -f nginx/docker-compose.yaml up -d

# 3. Penpot → http://penpot.localhost
cp penpot/.env.example penpot/.env
docker compose -f penpot/docker-compose.yaml up -d

# 4. SonarQube → http://sonarqube.localhost
cp sonarqube/.env.example sonarqube/.env
docker compose -f sonarqube/docker-compose.yaml up -d
# Default login: admin / admin (trocar no primeiro acesso)

# 5. Cloudflare Tunnel (acesso externo)
cp cloudflared/.env.example cloudflared/.env
# editar cloudflared/.env com o token real
docker compose -f cloudflared/docker-compose.yaml up -d
```

**Acesso externo:** configurar hostnames no Cloudflare Zero Trust dashboard:
- Tunnel → Public Hostnames → Add
  - `penpot.SEU-TUNNEL` → `http://penpot-frontend:8080`
  - `sonarqube.SEU-TUNNEL` → `http://sonarqube:9000`

> **Note:** SonarQube requer `vm.max_map_count=524288` em Linux.
> No Docker Desktop (Windows/Mac) é configurado automaticamente.

## Adding a new service

1. Create `service-name/` directory
2. Add `docker-compose.yaml` and `.env.example`
3. Document in this README
