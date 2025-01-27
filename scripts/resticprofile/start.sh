#!/bin/bash

cd /opt/denv

mkdir -p /data/repos;
mkdir -p ~/.ssh/state;

cp -f /etc/resticprofile/secrets/ssh/* ~/.ssh

chmod u+rwx,go-rwx ~/.ssh;

# add ssh remote to known hosts
REMOTE_BACKUP_HOST_KNOWN_HOSTS_STATE_FILE=~/.ssh/state/added-remote-backup-host-to-known-hosts.txt;
REMOTE_BACKUP_HOST_HOST="$(ssh -G remote-backup-host | awk '$1 == "hostname" { print $2 }')"
if [ ! -f "$REMOTE_BACKUP_HOST_KNOWN_HOSTS_STATE_FILE" ]; then
   ssh-keyscan $REMOTE_BACKUP_HOST_HOST >> ~/.ssh/known_hosts
   touch $REMOTE_BACKUP_HOST_KNOWN_HOSTS_STATE_FILE;
fi

# initialize repositories
bash /opt/denv/scripts/resticprofile/init.sh;
