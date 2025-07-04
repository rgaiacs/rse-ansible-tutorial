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

Variables
^^^^^^^^^

The `inventory`_ can contain variables and some variables are used to controls how Ansible interacts with the managed node.
For example,

- ``ansible_host`` configures the IP used when connecting to the managed node.
- ``ansible_user`` configures the user name used when connecting to the managed node.
- ``ansible_password`` configures the password used when connecting to the managed node.

..  warning::

    The password must **not** be stored as plain text in the `inventory`_. It is recommended to use `vault`_ to store passwords as illustrated in :doc:`hello-word-with-vault`.

The `inventory`_ would be

..  code:: yaml

    managed_node.com:
      hosts:
        one.managed_node.com:
          ansible_user: alice
          ansible_password: 123alice456
        two.managed_node.com:
          ansible_user: bob
          ansible_password: 123bob456

..  tip::

    Variables can also be defined for the group.

    ..  code:: yaml

        managed_node.com:
          hosts:
            one.managed_node.com:
            two.managed_node.com:
          vars:
            ansible_user: alice
            ansible_password: 123alice456

The full list of this variables is in `Connecting to hosts: behavioral inventory parameters <https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#connecting-to-hosts-behavioral-inventory-parameters>`_.

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

    ansible-playbook \
    --inventory path/to/production.yml \
    playbook.yml
