# genkaiki-infra

Infrastructure as Code for Genkaiki organization services.

## Services

| Service | Path | Port | Purpose |
|---------|------|------|---------|
| Penpot | `penpot/` | 9001 | Self-hosted design tool |
| SonarQube | `sonarqube/` | 9000 | Code quality & security analysis |

## Usage

Each service has its own directory with a `docker-compose.yaml` and `.env.example`.

```bash
# Penpot
cp penpot/.env.example penpot/.env
docker compose -f penpot/docker-compose.yaml up -d
docker compose -f penpot/docker-compose.yaml logs cloudflared  # get public URL

# SonarQube
cp sonarqube/.env.example sonarqube/.env
docker compose -f sonarqube/docker-compose.yaml up -d
docker compose -f sonarqube/docker-compose.yaml logs cloudflared  # get public URL
# Default login: admin / admin (change on first access)
```

> **Note:** SonarQube requires `vm.max_map_count=524288` on Linux hosts.
> On Docker Desktop (Windows/Mac) this is handled automatically.

## Adding a new service

1. Create `service-name/` directory
2. Add `docker-compose.yaml` and `.env.example`
3. Document in this README
