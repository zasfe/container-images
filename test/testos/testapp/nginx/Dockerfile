# step1: base image download
FROM alpine

# step2: /etc/apk/repositories fix
RUN	sed -i 's/https/http/g' /etc/apk/repositories

# step3: nginx packgae add
RUN     apk add nginx

# step4: nginx.conf add
# step5: port 80/tcp
EXPOSE  80

# step6: excute
#ENTRYPOINT     ["nginx"]
#CMD            ["-g", "daemon off;"]
CMD     nginx -g 'daemon off;'
