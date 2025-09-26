FROM rockylinux:9

ENV container=docker

RUN [ ! -f /usr/sbin/init ] && dnf -y update && dnf -y install systemd && dnf clean all

RUN ([ -d /lib/systemd/system/sysinit.target.wants ] && \
        cd /lib/systemd/system/sysinit.target.wants/ && \
        for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /lib/systemd/system/basic.target.wants/* ; \
    rm -f /lib/systemd/system/anaconda.target.wants/*

VOLUME ["/sys/fs/cgroup"]

CMD ["/usr/sbin/init"]
