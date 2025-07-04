Hello World with Jinja
======================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`hello-world-with-jinja.zip <./examples/hello-world-with-jinja.zip>`.

In :doc:`introduction`, it was mentioned that `inventory`_ can contain variables. In this section, you will learn how to use variables from the `inventory`_ in the `playbook`_.

Inventory
---------

..  literalinclude:: examples/hello-world-with-jinja/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

The above `inventory`_ defines a variable named ``hello_world_text``.

Playbook
--------

..  literalinclude:: examples/hello-world-with-jinja/playbook.yaml
    :caption: playbook.yml
    :language: yaml

The above `playbook`_ uses the variable named ``hello_world_text`` defined in the `inventory`_.

..  important::

    The ``{{ variable_name }}`` is from `Jinja`_.

Running
-------

..  code:: bash

    cd hello-world-with-jinja
    ansible-playbook \
    -i inventories/production.yml \
    playbook.yaml

..  include:: vault-password.rst

returns ::

    PLAY [My first play] ***********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_01]

    TASK [Print message] ***********************************************************
    ok: [managed_node_01] => {
        "msg": "Hello!"
    }

    PLAY RECAP *********************************************************************
    managed_node_01               : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
