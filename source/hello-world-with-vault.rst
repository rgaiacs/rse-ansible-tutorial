Hello World with Vault
======================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`hello-world-with-vault.zip <./examples/hello-world-with-vault.zip>`.

This small example illustrates the concepts from :doc:`introduction`. 

Inventory
---------

..  literalinclude:: examples/hello-world/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

The above `inventory`_ has a single group called ``web`` that has a single managed node called ``managed_node`` and the connection details. 

Playbook
--------

..  literalinclude:: examples/hello-world/playbook.yaml
    :caption: playbook.yml
    :language: yaml

The above `playbook`_ has a single `play`_ that runs a single `task`_ on the managed nodes from group ``web``. 

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
