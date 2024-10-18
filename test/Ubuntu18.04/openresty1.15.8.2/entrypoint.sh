#!/bin/bash

#ssl_certificate /etc/ssl/resty-auto-ssl-fallback.crt;
#ssl_certificate_key /etc/ssl/resty-auto-ssl-fallback.key;


    # openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 \
    #   -subj '/CN=sni-support-required-for-valid-ssl' \
    #   -keyout /etc/ssl/resty-auto-ssl-fallback.key \
    #   -out /etc/ssl/resty-auto-ssl-fallback.crt
    
if [ ! -f "/etc/ssl/resty-auto-ssl-fallback.key" ] || [ ! -f "/etc/ssl/resty-auto-ssl-fallback.crt" ] ;
then
    openssl req -new -newkey rsa:2048 -days 730 -nodes -x509 \
       -subj '/CN=${HOSTNAME}' \
       -keyout /etc/ssl/resty-auto-ssl-fallback.key \
       -out /etc/ssl/resty-auto-ssl-fallback.crt
fi

/usr/local/openresty/bin/openresty -g 'daemon off;'
