FROM debian:stable

RUN <<EOF
apt-get update
apt-get install  lighttpd -y
rm -f /var/www/html/index.html
EOF


COPY ./conf/index.html /var/www/html
COPY ./conf/theone.pdf /var/www/html
COPY ./conf/lighttpd.conf /etc/lighttpd/lighttpd.conf


EXPOSE 8080
COPY ./tools/entrypoint.sh /
RUN chmod +x /entrypoint.sh 

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]