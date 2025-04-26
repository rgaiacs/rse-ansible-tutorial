Hello World
===========

Users must provide two files to `Ansible`_: a `inventory`_ listing the managed nodes and a `playbook`_ listing the operations to be performed on the managed nodes.

Inventory
---------

..  literalinclude:: examples/hello-world/inventories/production.yml
    :name: inventories/production.yml
    :language: yaml

Playbook
--------

..  literalinclude:: examples/hello-world/playbook.yaml
    :name: playbook.yml
    :language: yaml

Running
-------

..  code:: bash

    cd hello-world
    ansible-playbook \
    -i inventories/production.yml \
    playbook.yaml

returns ::

    PLAY [My first play] ***********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node]

    TASK [Print message] ***********************************************************
    ok: [managed_node] => {
        "msg": "Hello world"
    }

    PLAY RECAP *********************************************************************
    managed_node               : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
