#!/bin/bash


if [ ! -e "/var/lib/mysql/wordpress" ]; then
	mysql_install_db
	service mariadb start
	cat ./secure.in | envsubst | mysql_secure_installation

	cat ./wp.sql | envsubst | /usr/bin/mariadb -uroot -p$MYSQL_ROOT_PASSWORD
	service mariadb stop
fi

exec $@