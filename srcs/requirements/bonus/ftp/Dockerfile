FROM debian:stable



# installl dependancy
RUN <<EOF
apt update
apt install vsftpd  -y
EOF


COPY ./conf/vsftpd.conf /etc

WORKDIR /ftp-server
COPY ./tools/ftp.sh .
RUN chmod +x ./ftp.sh
EXPOSE 20 21 40000-40009
# ENTRYPOINT [ "php" , "-S" , "0.0.0.0:5555", "-t", "/adminer/" ]

ENTRYPOINT [ "./ftp.sh" ]
CMD ["/usr/sbin/vsftpd"]
