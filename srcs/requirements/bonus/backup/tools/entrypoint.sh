#!/bin/sh

sleep 10
mkdir -p /backups
bash /app/backup.sh &> /dev/null
echo "backups for wordpress start "

exec $@