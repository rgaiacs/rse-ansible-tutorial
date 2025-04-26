Introduction
============

Users must provide two files to `Ansible`_: a `inventory`_ listing the managed nodes and a `playbook`_ listing the operations to be performed on the managed nodes.

Inventory
---------

The `inventory`_ is a `YAML`_ in the format

..  code:: yaml

    managed_node.com:
      hosts:
        one.managed_node.com:
        two.managed_node.com:

where:

- ``managed_node.com`` is the name of the group.
- ``hosts`` is a reserved workd.
- ``one.managed_node.com`` and ``two.managed_node.com`` are the name of the servers.

Playbook
--------

The `playbook`_ is a `YAML`_  with a list of `plays <play_>`_, for example

..  code:: yaml

    - name: Configure servers
      hosts:
        - managed_node.com
      tasks:
        ...
    - name: Start servers
      hosts:
        - managed_node.com
      tasks:
        ...

..  tip::

    It is recommended to use ``ansible-lint`` to check the `playbook`_ for errors.

To run a `playbook`, use

..  code:: bash

    ansible-playbook playbook.yml
