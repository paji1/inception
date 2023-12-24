#!/bin/sh



if [ ! -f /home/$FTP_USER ]; then

	useradd -m -p $(openssl passwd -1 $FTP_PASS) $FTP_USER
	mkdir -p /var/run/vsftpd/wordpress
	chmod 555 /var/run/vsftpd/wordpress
	mkdir -p /home/$FTP_USER/wordpress
	chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/wordpress
	usermod -d /home/$FTP_USER/wordpress $FTP_USER
	echo ftp for wordpress running ...
fi

exec $@