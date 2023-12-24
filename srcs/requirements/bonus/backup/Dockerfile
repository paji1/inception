
FROM debian:stable

RUN apt-get update && apt-get install -y cron

WORKDIR /app

COPY ./tools/backup.sh /app/backup.sh
RUN chmod +x /app/backup.sh

RUN echo "0 0 * * * /app/backup.sh" | crontab -

COPY ./tools/entrypoint.sh /
RUN chmod +x /entrypoint.sh 

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["cron", "-f"]