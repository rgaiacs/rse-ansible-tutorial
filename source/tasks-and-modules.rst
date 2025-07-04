Tasks and modules
=================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`tasks-and-modules.zip <./examples/tasks-and-modules.zip>`.


In :doc:`introduction`, we mentioned that a `playbook`_ is a list of `plays <play_>`_. A `play`_ has one or more `tasks <task_>`_. A `task`_ is the combination of

- metadata (for example, the name of the `task`_),
- `module`_ and its arguments, and
- additional instructions (for example, for repeat the `module`_ with different values).

So far, the only `module`_ that we use was `ansible.builtin.debug`_ that is part of the `default library`_, a large collection of `modules <module>`_ that is provided with `Ansible`_. Additional `module`_ are available from `Ansible Galaxy`_.

Playbook
--------

..  literalinclude:: examples/tasks-and-modules/playbook.yaml
    :caption: playbook.yml
    :language: yaml

The above `playbook`_ has a single `play`_ with two `tasks <task>`_:

1.  creates a directory.
2.  insert a line in a file. 

Running
-------

..  code:: bash

    cd task-and-modules
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    playbook.yaml

..  include:: vault-password.rst

returns ::

    PLAY [Creating files] **********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_01]

    TASK [Create a directory if it does not exist] *********************************
    ok: [managed_node_01]

    TASK [Ensure line is present in file] ******************************************
    ok: [managed_node_01]

    PLAY RECAP *********************************************************************
    managed_node_01            : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
