#!/bin/bash

chmod +x /opt/scripts/logs/resticprofile.sh;

chmod +x /opt/scripts/watch-resticprofile.sh;

echo "Creating /data/logs/supervisord"
mkdir -p /data/logs/supervisord;

systemctl enable cron;
service cron start;

bash /opt/denv/scripts/resticprofile/start.sh;

/usr/bin/supervisord;
