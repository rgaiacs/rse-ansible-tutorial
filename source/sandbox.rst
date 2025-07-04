Sandbox
=======

When learning `Ansible`_ is very convenient to have a sandbox environment based on `virtual machine`_ or `container`_.

Container
---------
.. mermaid::
    :align: center
    :alt: User operating two containers in the same network.
    :caption: Diagram of sandbox using container for Ansible.

    flowchart LR
        c[Control Node] --> m1[Managed Node 01]
        c[Control Node] --> m2[Managed Node 02]
        c[Control Node] --> m3[Managed Node 03]
        c[Control Node] --> m4[Managed Node 04]
        s[Shell] --> c
        u[User] --> s

        subgraph n[Container Network]
            c
            m1
            m2
            m3
            m4
        end

        subgraph h[Host]
            s
            n
        end


Podman
^^^^^^

Docker
^^^^^^

..  tip::

    All the files from this section are in :download:`sandbox-docker.zip`.

Start the containers with

..  code:: bash

    docker compose up -d

and access the control node with

..  code:: bash

    docker compose exec -it control-node /bin/sh
