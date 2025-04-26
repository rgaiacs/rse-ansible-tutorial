FROM docker.io/library/alpine:3.21.3

ENV PATH="$PATH:/root/.local/bin"

RUN apk add --no-cache \
    python \
    openssh && \
    rc-update add sshd

ENTRYPOINT ["tail", "-f", "/dev/null"]
