FROM docker.io/library/alpine:3.21.3

RUN apk add --no-cache \
    openssh \
    sshpass \
    pipx \
    py3-kubernetes \
    helm

RUN adduser ansible -D

USER ansible

ENV PATH="$PATH:/home/ansible/.local/bin"

RUN pipx install --include-deps ansible==11.1.0 && \
    pipx inject --include-apps ansible ansible-lint==24.12.2

RUN mkdir -p /home/ansible/.ssh && \
    echo 'Host *' >> /home/ansible/.ssh/config && \
    echo '    StrictHostKeyChecking no' >> /home/ansible/.ssh/config && \
    chmod 400 /home/ansible/.ssh/config && \
    mkdir -p /home/ansible/.kube && \
    mkdir -p /home/ansible/tutorial

WORKDIR /home/ansible/tutorial

ENTRYPOINT ["tail", "-f", "/dev/null"]
