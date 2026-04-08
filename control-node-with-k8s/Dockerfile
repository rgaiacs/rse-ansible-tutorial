FROM docker.io/library/alpine:3.23.3

RUN adduser ansible -D

USER ansible

ENV PATH="$PATH:/home/ansible/.local/bin"

WORKDIR /home/ansible

ENTRYPOINT ["tail", "-f", "/dev/null"]

RUN apk add --no-cache \
    openssh \
    sshpass \
    pipx \
    py3-kubernetes \
    helm

RUN pipx install --include-deps ansible==13.5.0 && \
    pipx inject --include-apps ansible ansible-lint==26.4.0

RUN mkdir -p /home/ansible/.ssh && \
    echo 'Host *' >> /home/ansible/.ssh/config && \
    echo '    StrictHostKeyChecking no' >> /home/ansible/.ssh/config && \
    chmod 400 /home/ansible/.ssh/config && \
    mkdir -p /home/ansible/.kube
