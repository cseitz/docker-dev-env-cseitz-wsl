# docker-dev-env-cseitz-wsl

A development environment that runs various containers behind a Traefik reverse proxy with automatic backup capabilities to ensure data is not lost in the event of the development environment encountering data loss.

## Start all services

```bash
docker compose -f docker/compose/resticprofile/docker-compose.yml up -d --build
docker compose -f docker/compose/elasticsearch/docker-compose.yml up -d
docker compose -f docker/compose/mongo/docker-compose.yml up -d
docker compose -f docker/compose/postgres/docker-compose.yml up -d
docker compose -f docker/compose/traefik/docker-compose.yml up -d
```

### Traefik

Traefik acts as a reverse proxy to all the other containers.

```bash
docker compose -f docker/compose/traefik/docker-compose.yml up -d
```

You can edit configuration in [`config/traefik`](./config/traefik), or copy configuration over to this directory from other projects.

If you make a change to any traefik config that isnt the `traefik.yml`, please run:
```bash
# trigger hot reload by touching traefik root config file
touch config/traefik/traefik.yml
```

### Resticprofile

Resticprofile is used to eligible backup container data.

```bash
docker compose -f docker/compose/resticprofile/docker-compose.yml up -d --build
```

You can view backup status in [`temp/backup/status`](./temp/backup/status).

### MongoDB

Accessible at `mongodb://mongo.localhost.seitz.sh/?tls=false&directConnection=true`

```bash
docker compose -f docker/compose/mongo/docker-compose.yml up -d
```

### Postgres

Accessible at `http://postgres.localhost.seitz.sh`

```bash
docker compose -f docker/compose/postgres/docker-compose.yml up -d
```

### ElasticSearch

Accessible at `http://elasticsearch.localhost.seitz.sh`

```bash
docker compose -f docker/compose/elasticsearch/docker-compose.yml up -d
```

