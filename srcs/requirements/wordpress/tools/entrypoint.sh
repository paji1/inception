#!/bin/bash

CONFIG_PATH="/var/www/html/wordpress/wp-config.php"
CONFIG_PATH_TMP="/var/www/html/wordpress/tmp_conf.php"

cat $CONFIG_PATH_TMP | envsubst > $CONFIG_PATH
rm -rf $CONFIG_PATH_TMP

sleep 5
exec "$@"
