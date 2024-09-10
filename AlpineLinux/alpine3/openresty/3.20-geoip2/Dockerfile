FROM openresty/openresty:alpine

RUN apk add --no-cache git build-base pcre-dev openssl-dev zlib-dev linux-headers \
    && cd /tmp \
    && git clone https://github.com/leev/ngx_http_geoip2_module.git \
    && cd ngx_http_geoip2_module \
    && git submodule update --init \
    && cd /tmp \
    && wget https://openresty.org/download/openresty-$(openresty -v 2>&1 | cut -d '/' -f 2).tar.gz \
    && tar -xzvf openresty-*.tar.gz \
    && cd openresty-* \
    && ./configure --add-dynamic-module=/tmp/ngx_http_geoip2_module \
    && make modules \
    && cp build/nginx-*/objs/ngx_http_geoip2_module.so /usr/local/openresty/nginx/modules/ \
    && rm -rf /tmp/* \
    && apk del git build-base

RUN mkdir -p /usr/local/openresty/nginx/conf/geoip
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY geoip.conf /usr/local/openresty/nginx/conf/geoip/geoip.conf

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
