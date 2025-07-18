FROM docker.io/library/alpine:3.21.3

ENV PATH="$PATH:/root/.local/bin"

RUN apk add --no-cache \
    sudo \
    python3 \
    openrc \
    openssh

RUN ssh-keygen -A

RUN adduser -D ansible \
    && echo 'ansible ALL=(ALL) ALL' > /etc/sudoers.d/ansible \
    && echo ansible:123 | chpasswd

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
