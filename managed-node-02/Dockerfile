FROM docker.io/library/debian:12.10-slim

ENV PATH="$PATH:/root/.local/bin"

RUN apt install -y \
    python3 \
    openrc \
    openssh \
    && apt-get clean \
    rm -rf /var/lib/apt/lists/*

RUN ssh-keygen -A

RUN adduser ansible -D \
    && echo ansible:123 | chpasswd

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
