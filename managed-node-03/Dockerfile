FROM docker.io/library/ubuntu:25.04

ENV PATH="$PATH:/root/.local/bin"

RUN apt update \
    && apt install -y \
    python3 \
    openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ssh-keygen -A

RUN adduser --disabled-password --comment '' ansible \
    && usermod -aG sudo ansible \
    && echo ansible:123 | chpasswd

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
