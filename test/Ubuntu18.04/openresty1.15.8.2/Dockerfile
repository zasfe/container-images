FROM openresty/openresty:1.15.8.2-bionic

RUN apt-get update && apt-get install -y gcc make \
    && luarocks install lua-resty-auto-ssl \
    && mkdir /etc/resty-auto-ssl \
    && mkdir /usr/local/openresty/nginx/conf/conf.d \
    && mkdir /var/spool/nginx \
    && adduser --system --no-create-home --disabled-login --disabled-password --group nginx \
    && chown nginx -R /usr/local/openresty \
    && chgrp nginx -R /usr/local/openresty \
    && chown nginx -R /etc/resty-auto-ssl \
    && chgrp nginx -R /etc/resty-auto-ssl \    
    && chown nginx -R /var/spool/nginx \
    && chgrp nginx -R /var/spool/nginx

COPY conf/*.conf /usr/local/openresty/nginx/conf/
COPY entrypoint.sh /usr/local/openresty/bin/

RUN chmod +x /usr/local/openresty/bin/entrypoint.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/usr/local/openresty/bin/entrypoint.sh"]
