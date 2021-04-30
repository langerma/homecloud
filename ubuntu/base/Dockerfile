FROM ubuntu:20.04

ENV container docker
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list \
    && apt-get -y update \
    && yes | unminimize \
    && apt-get -y dist-upgrade \
    && apt-get -y install systemd systemd-sysv openssh-server \
    && apt-get -y autoremove --purge \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /lib/systemd/system/sysinit.target.wants/ \
    && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/* \
    /lib/systemd/system/plymouth* \
    /lib/systemd/system/systemd-update-utmp*

RUN mkdir -p -m 0755 /run/sshd /root/.ssh \
    && systemctl enable ssh

ENTRYPOINT ["/lib/systemd/systemd"]
STOPSIGNAL SIGRTMIN+3
