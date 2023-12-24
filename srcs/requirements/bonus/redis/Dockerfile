FROM debian:stable



# installl dependancy
RUN <<EOF
apt update
apt install redis-server -y
EOF


COPY ./conf/redis.conf /etc/redis/redis.conf
RUN chmod 644 /etc/redis/redis.conf

RUN <<EOF
EOF

EXPOSE 6379
ENTRYPOINT [ "redis-server" , "/etc/redis/redis.conf"]

# ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
