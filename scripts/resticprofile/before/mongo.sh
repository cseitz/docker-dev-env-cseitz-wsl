#!/bin/bash

cd /opt/denv

# docker compose -p denv config > /data/compose.config.yaml

docker exec denv-mongo bash -c "cd /data; rm -rf dump; mongodump"

mkdir -p /data/volumes/denv-mongo-data
docker cp denv-mongo:/data/dump /data/volumes/denv-mongo-data

ls /data/volumes/denv-mongo-data/dump

mkdir -p /opt/denv/temp/backup/volumes
rm -rf /opt/denv/temp/backup/volumes/denv-mongo-data; cp -R /data/volumes/denv-mongo-data /opt/denv/temp/backup/volumes/denv-mongo-data

# import current mongo into denv-mongo
# docker cp mongo:/data/dump /tmp/import-dump; docker cp /tmp/import-dump denv-mongo:/data/import-dump; docker exec denv-mongo bash -c "cd /data; mongorestore --dir import-dump"
