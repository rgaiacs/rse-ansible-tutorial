FROM docker.io/library/alpine:3.23.3

RUN adduser ansible -D

ENTRYPOINT ["tail", "-f", "/dev/null"]

RUN apk add --no-cache \
    openssh \
    sshpass \
    pipx

RUN pipx install --include-deps ansible==13.5.0 && \
    pipx inject --include-apps ansible ansible-lint==26.4.0

USER ansible
    
RUN mkdir -p /home/ansible/.ssh && \
    echo 'Host *' >> /home/ansible/.ssh/config && \
    echo '    StrictHostKeyChecking no' >> /home/ansible/.ssh/config && \
    chmod 400 /home/ansible/.ssh/config

ENV PATH="$PATH:/home/ansible/.local/bin"

WORKDIR /home/ansible
