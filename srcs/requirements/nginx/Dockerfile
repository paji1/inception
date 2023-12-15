FROM debian:stable



# installl dependancy
RUN <<EOF
apt update
apt install nginx openssl -y
EOF



# certif 
ARG CERT_PATH=/etc/nginx/crtf
RUN mkdir ${CERT_PATH}

RUN <<EOF
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -keyout ${CERT_PATH}/ca.key -out ${CERT_PATH}/ca.crt -subj "/C=XX/ST=Rabat/L=Sale/O=taha/OU=taha/CN=tel-mouh.42.fr"
EOF

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf


CMD ["nginx", "-g", "daemon off;"]
