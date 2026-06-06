# genkaiki-infra

Infrastructure as Code for Genkaiki organization services.

## Services

| Service | Path | Port | Purpose |
|---------|------|------|---------|
| Penpot | `penpot/` | 9001 | Self-hosted design tool |

## Usage

Each service has its own directory with a `docker-compose.yaml` and `.env.example`.

```bash
cp penpot/.env.example penpot/.env
# edit .env with real values
docker compose -f penpot/docker-compose.yaml up -d
```

## Adding a new service

1. Create `service-name/` directory
2. Add `docker-compose.yaml` and `.env.example`
3. Document in this README
