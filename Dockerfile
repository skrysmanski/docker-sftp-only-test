FROM krys/ubuntu-base

# Create necessary directories
# '/run/sshd' is the so call "privilege separation directory"
RUN mkdir -p /app && mkdir -p /etc/ssh && mkdir -p /run/sshd

COPY files/sshd_config /etc/ssh/

RUN apt-get update && apt-get install -y openssh-server

EXPOSE 22

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
