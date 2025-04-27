Tasks and modules
=================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`task-and-modules.zip <./examples/task-and-modules.zip>`.


In :doc:`introduction`, we mentioned that a `playbook`_ is a list of `plays <play_>`_. A `play`_ has one more more `tasks <task>`_. A task is the combination of

- metadata (for example, the name of task),
- `module`_ and its arguments, and
- additional instructions (for example, for repeat the `module`_ with different values).

So far, the only `module`_ that we use was `ansible.builtin.debug`_ that is part of the `default library`_, a large collection of `modules <module>`_ that is provided with `Ansible`_. Additional `module`_ are available from `Ansible Galaxy`_.

Playbook
--------

..  literalinclude:: examples/task-and-modules/playbook.yaml
    :caption: playbook.yml
    :language: yaml

The above `playbook`_ has a single `play`_ with two `tasks <task>`_. The first task creates a directory and the second task insert a line in a file. 

Running
-------

..  code:: bash

    cd task-and-modules
    ansible-playbook \
    -i inventories/production.yml \
    playbook.yaml

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
