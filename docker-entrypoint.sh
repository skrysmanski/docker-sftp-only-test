#!/bin/bash
set -e

if [ ! -f '/app/ssh_host_rsa_key' ]; then
    ssh-keygen -t rsa -N "" -f /app/ssh_host_rsa_key
fi

exec /usr/sbin/sshd -D
