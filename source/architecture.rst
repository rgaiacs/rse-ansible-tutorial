Architecture
============

`Ansible`_ uses a `agentless`_ `push model`_ architecture.

.. mermaid::
    :align: center
    :alt: Control node linked by arrows to three managed nodes.
    :caption: Diagram of Ansible architecture.

    flowchart LR
        c[Control Node] --> m1[Managed Node #1]
        c[Control Node] --> m2[Managed Node #2]
        c[Control Node] --> m3[Managed Node #3]

Control node
------------

The control node is the machine that runs Ansible. The requirements are

- `Python`_
- `Ansible`_
- `SSH client`_

Managed node
------------

The managed node is the machine that is managed by Ansible. The requirements are

- `Python`_
- `SSH server`_