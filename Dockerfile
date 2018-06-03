FROM krys/ubuntu-base

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir -p /run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
