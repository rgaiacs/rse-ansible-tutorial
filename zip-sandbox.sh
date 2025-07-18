#!/bin/sh

CONTAINERS="control-node managed-node-01 managed-node-02 managed-node-03 managed-node-04"

DOCKER_ZIP=source/sandbox-docker.zip

PODMAN_ZIP=source/sandbox-podman.zip

rm -f $DOCKER_ZIP $PODMAN_ZIP

zip $DOCKER_ZIP compose.yml

zip $PODMAN_ZIP play.yml

for container in $CONTAINERS
do
    zip -r $DOCKER_ZIP $container
    zip -r $PODMAN_ZIP $container
done
