# sshd
#
# VERSION               0.0.2

FROM centos:centos7
MAINTAINER "you" <your@email.here>

ENV container docker
RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*; \
rm -f /usr/lib/tmpfiles.d/systemd-nologin.conf;

RUN yum -y install \
  cronie \
  curl \
  epel-release \
  git \
  net-tools \
  openssh-clients \
  openssh-server \
  sudo \
  telnet
RUN yum -y install ansible
#RUN yum clean all
RUN systemctl enable sshd

RUN echo 'root:ansible' | chpasswd
RUN useradd -m ansible -s /bin/bash
RUN usermod -aG wheel ansible

COPY sudoers /etc/sudoers
COPY ssh_config /root/.ssh/config
COPY id_rsa.pub /root/.ssh/authorized_keys
COPY id_rsa.pub /root/.ssh/
COPY id_rsa /root/.ssh/
COPY id_rsa.pub /home/ansible/.ssh/authorized_keys
COPY id_rsa.pub /home/ansible/.ssh/
COPY id_rsa /home/ansible/.ssh/
RUN chown -R ansible:ansible /home/ansible/.ssh

EXPOSE 22
EXPOSE 80
CMD ["/usr/sbin/init"]
