Hello World with Vault
======================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`hello-world-with-vault.zip <./examples/hello-world-with-vault.zip>`.

`Ansible`_ includes a `vault`_ that is the recommended to use to store passwords and other secrets.

Vault
-----

..  literalinclude:: examples/hello-world-with-vault/vault/production
    :caption: vault/production
    :language: yaml

`vault`_ encrypts the content of the file. The content can be decrypt with

..  code:: bash

    ansible-vault view vault/production

..  include:: vault-password.rst

For our example, it returns ::

    managed_node_01_password: 123

Inventory
---------

..  literalinclude:: examples/hello-world-with-vault/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

The above `inventory`_ uses the variable ``managed_node_01_password`` defined in the `vault`_. 

..  tip::

    As you will learn later in :doc:`variable-precedence`, the variable ``ansible_password`` can be defined in the `vault`_ and code duplication can be avoided.

Playbook
--------

..  literalinclude:: examples/hello-world-with-vault/playbook.yaml
    :caption: playbook.yml
    :language: yaml

Running
-------

When using `vault`_, a few more arguments to ``ansible-playbook`` are required. ``--ask-vault-pass`` is used to prompt the user for the password for the `vault`_ and ``--extra-vars`` is used to add the `vault`_ to be used.

..  code:: bash

    cd hello-world-with-vault
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    playbook.yaml

..  include:: vault-password.rst

returns ::

    PLAY [My first play] ***********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_01]

    TASK [Print message] ***********************************************************
    ok: [managed_node_01] => {
        "msg": "Hello world"
    }

    PLAY RECAP *********************************************************************
    managed_node_01               : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
