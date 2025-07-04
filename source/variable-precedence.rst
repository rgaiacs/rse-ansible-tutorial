Variable precedence
===================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`variable-precedence.zip <./examples/variable-precedence.zip>`.

In :doc:`hello-world`, :doc:`hello-world-with-vault` and :doc:`hello-world-with-jinja`, we saw that variables can be declared in multiple places. Best practices are

1.  keep passwords and secrets in `vault`_.
2.  keep variables shared among managed nodes in the group level of the `inventory`_. A special group named ``all`` can be used for variables shared among **all** managed nodes.
3.  keep variables specific to a managed node in the host level.

This best practices help to avoid declaring variables in two or more places and have to worry about variable precedence.

..  note::

    The full list of variable precedence is documented in `Understanding variable precedence <https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#understanding-variable-precedence>`_.

Vault
-----

The decrypt version is ::

    ansible_password: 123

Because the `vault`_ is passed using ``--extra-vars``, ``ansible_password`` has the highest precedence possible and will override all other occurences.  

Inventory
---------

..  literalinclude:: examples/variable-precedence/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

The variables in the special group ``all`` are override by the variables in the group level that are override by the variables in the host level.

Playbook
--------

..  literalinclude:: examples/variable-precedence/playbook.yaml
    :caption: playbook.yml
    :language: yaml

Running
-------

..  code:: bash

    cd variable-precedence
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    playbook.yaml

..  include:: vault-password.rst

returns ::

    PLAY [My first play] ***********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_02]
    ok: [managed_node_03]
    ok: [managed_node_01]

    TASK [Print ansible_password] **************************************************
    ok: [managed_node_01] => {
        "msg": "Hello from frontend"
    }
    ok: [managed_node_02] => {
        "msg": "Hello from node 02"
    }
    ok: [managed_node_03] => {
        "msg": "Hello from backend"
    }

    PLAY RECAP *********************************************************************
    managed_node_01            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    managed_node_02            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    managed_node_03            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
