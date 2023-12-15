FROM debian:stable



# installl dependancy
RUN <<EOF
apt update
apt install mariadb-server mariadb-client -y
EOF

COPY ./tools/script.sh /usr/local/bin
COPY ./conf/wp.sql /u
WORKDIR /mariadb
RUN <<EOF
cat ~/wp.sql | mysql --defaults-extra-file=/etc/mysql/debian.cnf
EOF
ENTRYPOINT [ "/usr/local/bin/script.sh" ]

CMD [ "/usr/bin/mariadbd-safe" ]
