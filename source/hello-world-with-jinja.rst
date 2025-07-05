Hello World with Jinja
======================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`hello-world-with-jinja.zip <./examples/hello-world-with-jinja.zip>`.

In :doc:`introduction`, it was mentioned that `inventory`_ can contain variables. In this section, you will learn how to use variables from the `inventory`_, `vault`_, or command line in the `playbook`_.

..  note::

    Variables are passed to Ansible from the command line using ``--extra-vars``.

Inventory
---------

..  literalinclude:: examples/hello-world-with-jinja/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

The above `inventory`_ defines a variable named ``hello_world_text`` and uses a variable ``managed_node_password`` defined in the `vault`_.

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
        "msg": "Hello world!"
    }

    PLAY RECAP *********************************************************************
    managed_node_01               : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Filters
-------

Jinja allow the use of filters to modify the value of variables. You can use `Jinja's builtin filters <https://jinja.palletsprojects.com/en/stable/templates/#builtin-filters>`_, `Ansible's builtin filters <https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_filters.html>`_, or `your own custom filter <https://docs.ansible.com/ansible/latest/dev_guide/developing_plugins.html#developing-filter-plugins>`_. Filters are separated from the variable by a pipe symbol (``|``) and may have optional arguments in parentheses. Multiple filters can be chained.

Playbook
^^^^^^^^

..  literalinclude:: examples/hello-world-with-jinja/playbook-with-filter.yaml
    :caption: playbook.yml
    :language: yaml

Running
^^^^^^^

..  code:: bash

    cd hello-world-with-jinja
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    playbook-with-filter.yaml

..  include:: vault-password.rst

returns ::

    PLAY [My first play] ***********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_01]

    TASK [Print message] ***********************************************************
    ok: [managed_node_01] => {
        "msg": "HEL..."
    }

    PLAY RECAP *********************************************************************
    managed_node_01            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
