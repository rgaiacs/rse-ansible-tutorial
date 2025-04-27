Module and return
=================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`module-and-return.zip <./examples/module-and-return.zip>`.

At the end of the execution of a `module`_, a collection of values is return covering the execution. The return can be captured in a variable and used later, for example to conditionally execute the next step.

Playbook
--------

..  literalinclude:: examples/module-and-return/playbook.yaml
    :caption: playbook.yml
    :language: yaml

The above `playbook`_ has a single `play`_ with three `tasks <task>`_:

1.  get information regarding the file ``/usr/bin/git``.
2.  print the information collected in the previous task.
3.  execute ``git config`` if ``/usr/bin/git`` exists.

Running
-------

..  code:: bash

    cd module-and-return
    ansible-playbook \
    -i inventories/production.yml \
    playbook.yaml

returns ::

    PLAY [Collecting information] **************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_01]

    TASK [Get stats of /usr/bin/git] ***********************************************
    ok: [managed_node_01]

    TASK [Print message] ***********************************************************
    ok: [managed_node_01] => {
        "msg": {
            "changed": false,
            "failed": false,
            "stat": {
                "exists": false
            }
        }
    }

    TASK [Run git config] **********************************************************
    skipping: [managed_node_01]

    PLAY RECAP *********************************************************************
    managed_node_01            : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Note that the task ``Run git config`` was skipped.