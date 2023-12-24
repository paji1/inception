FROM debian:stable



# installl dependancy
RUN <<EOF
apt update
apt install software-properties-common ca-certificates lsb-release apt-transport-https wget unzip gettext -y
sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -
sudo apt update

apt install php8.2 php8.2-curl php8.2-fpm php8.2-bcmath php8.2-gd php8.2-soap php8.2-zip php8.2-curl php8.2-mbstring php8.2-mysqlnd php8.2-gd php8.2-xml php8.2-intl php8.2-zip php8.2-redis -y
EOF

WORKDIR /wordpress
RUN <<EOF
wget https://wordpress.org/latest.zip
mkdir -p /var/www/html/
unzip latest.zip -d /var/www/html/
rm -rf latest.zip
EOF


# certif 

# RUN mkdir ${CERT_PATH}


# WORKDIR /var/www/html
# cp ./wp-config-sample.php ./wp-config.php
COPY ./conf/wp-config.php /var/www/html/wordpress/tmp_conf.php
RUN chmod 777 /var/www/html/wordpress/tmp_conf.php
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/
RUN <<EOF
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
EOF

RUN <<EOF
apt-get update -y
apt-get install sed curl sendmail -y
EOF

RUN <<EOF
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
EOF


COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

WORKDIR /var/www/html/wordpress


EXPOSE 9000
CMD  ["/usr/sbin/php-fpm8.2", "-F"]
	