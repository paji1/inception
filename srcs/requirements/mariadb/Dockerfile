FROM debian:stable



# installl dependancy
RUN <<EOF
apt update
apt install mariadb-server mariadb-client gettext -y
EOF

COPY ./tools/script.sh /usr/local/bin

WORKDIR /mariadb
COPY ./conf/wp.sql .
COPY ./conf/secure.in .
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/my.cnf /etc/mysql/conf.d/my.cnf


RUN chmod 644 /etc/mysql/my.cnf
RUN chmod 644 /etc/mysql/conf.d/my.cnf
RUN chmod +rx ./wp.sql
RUN chmod +rx ./secure.in

ENTRYPOINT [ "/usr/local/bin/script.sh" ]

CMD [ "/usr/bin/mariadbd-safe" ]
