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
        c[Control Node] --> m1[Managed Node]
        s[Shell] --> c
        u[User] --> s

        subgraph n[Container Network]
            c
            m1
        end

        subgraph h[Host]
            s
            n
        end


Podman
^^^^^^

Docker
^^^^^^

..  code::bash

    docker compose up -d
