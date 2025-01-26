# docker-dev-env-cseitz-wsl

```bash
docker compose -f docker/compose/resticprofile/docker-compose.yml up -d --build
docker compose -f docker/compose/elasticsearch/docker-compose.yml up -d
docker compose -f docker/compose/mongo/docker-compose.yml up -d
docker compose -f docker/compose/postgres/docker-compose.yml up -d
docker compose -f docker/compose/traefik/docker-compose.yml up -d
```
