FROM redhat/ubi8:8.6-990

ENV container=docker
# see https://hub.docker.com/r/redhat/ubi8

RUN cd /lib/systemd/system/sysinit.target.wants/ ; \
    for i in * ; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i ; done ; \
    rm -f /lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /lib/systemd/system/basic.target.wants/* ; \
    rm -f /lib/systemd/system/anaconda.target.wants/*

VOLUME ["/sys/fs/cgroup"]

CMD ["/sbin/init"]
