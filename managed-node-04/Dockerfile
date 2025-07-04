FROM docker.io/library/fedora:42

ENV PATH="$PATH:/root/.local/bin"

RUN dnf install -y \
    python3 \
    openssh-server \
    && dnf clean all \
    && rm -rf /var/cache/dnf

RUN ssh-keygen -A

RUN adduser ansible \
    && echo ansible:123 | chpasswd

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
