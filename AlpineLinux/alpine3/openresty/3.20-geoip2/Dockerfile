# Stage 1: Build OpenResty with GeoIP2 module
FROM openresty/openresty:alpine-fat AS builder

RUN apk add --no-cache git build-base pcre-dev openssl-dev zlib-dev linux-headers perl libmaxminddb

# Clone and build GeoIP2 module
RUN cd /tmp \
    && git clone https://github.com/leev/ngx_http_geoip2_module.git \
    && cd ngx_http_geoip2_module \
    && git submodule update --init

# Get OpenResty source and build with GeoIP2 module
RUN cd /tmp \
    && wget https://openresty.org/download/openresty-\$(openresty -v 2>&1 | cut -d '/' -f 2).tar.gz \
    && tar -xzvf openresty-*.tar.gz \
    && cd openresty-* \
    && ./configure --add-dynamic-module=/tmp/ngx_http_geoip2_module \
    && make modules

# Stage 2: Create the final lightweight image
FROM openresty/openresty:alpine

# Copy the built module from the builder stage
COPY --from=builder /tmp/openresty-*/build/nginx-*/objs/ngx_http_geoip2_module.so /usr/local/openresty/nginx/modules/

# Install necessary runtime dependencies
RUN apk add --no-cache pcre libgcc

# Create directory for GeoIP database
RUN mkdir -p /usr/local/openresty/nginx/conf/geoip

# Copy configuration files
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY geoip.conf /usr/local/openresty/nginx/conf/geoip/geoip.conf

# Set the command to run OpenResty
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
