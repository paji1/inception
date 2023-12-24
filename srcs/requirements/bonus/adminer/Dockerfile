FROM debian:stable



# installl dependancy
RUN <<EOF
apt update
apt install php php-curl php-cli php-mysql php-gd  -y
EOF

WORKDIR /adminer
COPY ./conf/adminer.php ./index.php

EXPOSE 5555
ENTRYPOINT [ "php" , "-S" , "0.0.0.0:5555", "-t", "/adminer/" ]

# ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
