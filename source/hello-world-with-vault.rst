Hello World with Vault
======================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`hello-world-with-vault.zip <./examples/hello-world-with-vault.zip>`.

`Ansible`_ includes a `vault`_ that is recommended to use to store passwords and other secrets.

Vault
-----

`vault`_ encrypts the content of the file. For example,

..  literalinclude:: examples/hello-world-with-vault/vault/production
    :caption: vault/production
    :language: yaml

The content can be decrypt with

..  code:: bash

    ansible-vault view vault/production

..  include:: vault-password.rst

For our example, it returns ::

    managed_node_password: 123

To create a new `vault`_, we use

..  code:: bash

    ansible-vault create path/to/new/vault/file

And to edit a existing `vault`_, we use

..  code:: bash

    ansible-vault edit path/to/existing/vault/file

Inventory
---------

..  literalinclude:: examples/hello-world-with-vault/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

The above `inventory`_ uses the variable ``managed_node_01_password`` defined in the `vault`_. 

..  note::

    The syntax ``{{ variable_name }}`` is from `Jinja`_ and will be detailed later in :doc:`hello-world-with-jinja`.

..  tip::

    As you will learn later in :doc:`variable-precedence`, code duplication can be avoided with the variable ``ansible_password`` being defined in the `vault`_.

Playbook
--------

..  literalinclude:: examples/hello-world-with-vault/playbook.yaml
    :caption: playbook.yml
    :language: yaml

Running
-------

When using `vault`_, a few more arguments to ``ansible-playbook`` are required. ``--ask-vault-pass`` is used to prompt the user for the password for the `vault`_ and ``--extra-vars`` is used to load the variables defined in the `vault`_.

..  important::

    The location of the `vault`_ **must** be prepended with ``@`` to inform Ansible that the argument is a file.

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

Continuous Delivery
--------------------

In the previous example, we used ``--ask-vault-pass`` to manually provide the password for the `vault`_. In the context of continuous delivery , we need another way to provide the password. Most continuous delivery solutions provides a way to store and access secrets. The simplest solution is to store the password for the `vault`_ as a secret in the continuous delivery platform and, during execution, **temporarily** write the `vault`_ password to a file that will be shared with Ansible using ``--vault-password-file``. For example,

..  code:: bash

    cd hello-world-with-vault
    echo 123 > vault-password.txt
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    --vault-password-file vault-password.txt \
    playbook.yaml

uses the content of the file ``vault-password.txt``.