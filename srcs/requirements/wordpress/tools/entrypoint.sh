#!/bin/bash

CONFIG_PATH="/var/www/html/wordpress/wp-config.php"
CONFIG_PATH_TMP="/var/www/html/wordpress/tmp_conf.php"


if [ ! -f $CONFIG_PATH ]; then
	cat $CONFIG_PATH_TMP | envsubst > $CONFIG_PATH
	wp --allow-root core install  --url=$WORDPRESS_URL --title=$WORDPRESS_DB_NAME --admin_user=$WORDPRESS_DB_USER  --admin_password=$WORDPRESS_DB_PASSWORD  --admin_email=$WORDPRESS_EMAIL
	wp --allow-root plugin install redis-cache --activate
	wp --allow-root redis enable
fi

exec "$@"
