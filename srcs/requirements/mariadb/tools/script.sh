#!/bin/bash


if [ ! -e "/var/lib/mysql/wordpress" ]; then
	/usr/bin/mariadb -sfu root <<  EOF
UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS $MYSQL_DATABASE;
DELETE FROM mysql.db WHERE Db='$MYSQL_USER' OR Db='$MYSQL_USER\\_%';
FLUSH PRIVILEGES;
EOF
fi
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

exec $@