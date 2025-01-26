#!/bin/bash

cd /opt/denv

# docker compose -p denv config > /data/compose.config.yaml

docker exec denv-postgres bash -c "cd /data; rm -rf dump; mkdir dump; pg_dumpall -h localhost -U postgres > dump/postgres.dump.sql"

mkdir -p /data/volumes/denv-postgres-data
docker cp denv-postgres:/data/dump /data/volumes/denv-postgres-data

ls /data/volumes/denv-postgres-data/dump

mkdir -p /opt/denv/temp/backup/volumes
rm -rf /opt/denv/temp/backup/volumes/denv-postgres-data; cp -R /data/volumes/denv-postgres-data /opt/denv/temp/backup/volumes/denv-postgres-data

# import current postgres into denv-postgres
# docker cp postgres:/data/dump /tmp/import-dump; docker cp /tmp/import-dump denv-postgres:/data/import-dump; docker exec denv-postgres bash -c "cd /data; postgresrestore --dir import-dump"
