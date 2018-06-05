#!/bin/bash
set -e

if [ ! -f '/cert/ssh_host_rsa_key' ]; then
    ssh-keygen -t rsa -N "" -f /cert/ssh_host_rsa_key

    # Fix file ownership on MacOS
    # See: https://stackoverflow.com/a/43213455/614177
    PERMCHECK=$(su permcheck -c 'stat -c "%U" /cert/ssh_host_rsa_key')
    if [ ! "$PERMCHECK" = "root" ]; then
        chown root:root /cert/ssh_host_rsa_key
        chown root:root /cert/ssh_host_rsa_key.pub

        PERMCHECK=$(su permcheck -c 'stat -c "%U" /cert/ssh_host_rsa_key')
        if [ ! "$PERMCHECK" = "root" ]; then
            echo "ERROR: Could not fix file ownership of '/cert/ssh_host_rsa_key'"
            exit 1
        fi
    fi
fi

exec /usr/sbin/sshd -D
