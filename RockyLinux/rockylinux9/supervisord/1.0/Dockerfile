FROM rockylinux:9

ENV container=docker

# Python3 및 supervisor 설치
RUN dnf -y update && \
    dnf -y install python3 python3-pip && \
    pip3 install supervisor && \
    dnf clean all

# supervisord 기본 설정 파일 생성 (서비스 없음, nodaemon=True)
RUN echo "[supervisord]" > /etc/supervisord.conf && \
    echo "nodaemon=true" >> /etc/supervisord.conf

# 컨테이너 시작 시 supervisord 실행
CMD ["/usr/local/bin/supervisord", "-c", "/etc/supervisord.conf"]
