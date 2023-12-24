#!/bin/bash

export BACKUP_SOURCE="/var/www/html"  
export BACKUP_TARGET="/backups"       

TIMESTAMP=$(date "+%Y%m%d%H%M%S")

tar -czvf "$BACKUP_TARGET/backup_$TIMESTAMP.tar.gz" -C "$BACKUP_SOURCE" .

find "$BACKUP_TARGET" -type f -name "backup_*" -mtime +7 -exec rm {} \;
