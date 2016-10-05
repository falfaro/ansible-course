# sshd
#
# VERSION               0.0.2

# https://github.com/tianon/dockerfiles/tree/master/sbin-init/ubuntu/upstart/14.04
FROM ubuntu-upstart:14.04
MAINTAINER Felipe Alfaro Solana <felipe.alfaro@gmail.com>

RUN useradd -m ansible -s /bin/bash
RUN usermod -aG sudo ansible

COPY sudoers /etc/sudoers
COPY ssh_config /root/.ssh/config
COPY id_rsa.pub /root/.ssh/authorized_keys
COPY id_rsa.pub /root/.ssh/
COPY id_rsa /root/.ssh/
COPY id_rsa.pub /home/ansible/.ssh/authorized_keys
COPY id_rsa.pub /home/ansible/.ssh/
COPY id_rsa /home/ansible/.ssh/
RUN chown -R ansible:ansible /home/ansible/.ssh

RUN apt-get update
RUN apt-get install -y \
  curl \
  git \
  net-tools \
  openssh-server \
  telnet \
  sudo
RUN apt-get install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible
#RUN apt-get clean

EXPOSE 22
EXPOSE 80
CMD ["/sbin/init"]
