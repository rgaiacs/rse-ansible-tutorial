FROM docker.io/library/alpine:3.21.3

ENV PATH="$PATH:/root/.local/bin"

RUN apk add --no-cache \
    openssh
    pipx

RUN pipx install --include-deps ansible==11.1.0 && \
    pipx inject --include-apps ansible ansible-lint==24.12.2

ENTRYPOINT ["tail", "-f", "/dev/null"]
