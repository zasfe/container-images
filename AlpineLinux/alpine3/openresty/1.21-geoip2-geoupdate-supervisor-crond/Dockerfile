FROM alpine-openresty-geoip

# install supervisor
RUN apk update && apk add --no-cache supervisor bash

# copy files from current dir to folder in container
COPY ./conf/nginx.conf /etc/nginx/conf.d/
COPY ./favicon.ico /usr/local/openresty/nginx/html/
COPY ./conf/geoip.conf /opt/geoip.conf
COPY ./conf/crontab.txt /opt/crontab.txt
COPY ./conf/supervisord.conf /opt/

COPY ./gabia_ssl.crt /usr/local/share/ca-certificates/gabia_ssl.crt
RUN cat /usr/local/share/ca-certificates/gabia_ssl.crt >> /etc/ssl/certs/ca-certificates.crt
RUN apk --no-cache add ca-certificates \
    && rm -rf /var/cache/apk/* \
    && update-ca-certificates

# Remove default nginx conf
RUN rm -f /etc/nginx/conf.d/default.conf

# set up crontab
RUN /usr/bin/crontab /opt/crontab.txt
RUN mkdir -p /var/log/cron

EXPOSE 80

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
CMD ["start"]
