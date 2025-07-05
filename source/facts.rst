Facts
=====

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`facts.zip <./examples/facts.zip>`.

In :doc:`hello-world-with-jinja`, variables were introduced. In this section, you will learn about a special type of variables named `facts <fact>`_ that are gathered from the managed nodes. `Facts <fact>`_ can be used to conditionally execution of `tasks <task>`_ as illustrated in :doc:`module-and-return`.

Playbook
--------

..  literalinclude:: examples/facts/playbook.yaml
    :caption: playbook.yml
    :language: yaml

The above `playbook`_ has a single `play`_ with a single `task`_ that prints the name of the GNU/Linux distribution running on the managed node.

Running
-------

..  code:: bash

    cd facts && 
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    playbook.yaml

..  include:: vault-password.rst

returns ::

    PLAY [Display facts] ***********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_02]
    ok: [managed_node_03]
    ok: [managed_node_04]
    ok: [managed_node_01]

    TASK [Display GNU/Linux distribution] ******************************************
    ok: [managed_node_01] => {
        "msg": "Alpine"
    }
    ok: [managed_node_02] => {
        "msg": "Debian"
    }
    ok: [managed_node_03] => {
        "msg": "Ubuntu"
    }
    ok: [managed_node_04] => {
        "msg": "Fedora"
    }

    PLAY RECAP *********************************************************************
    managed_node_01            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    managed_node_02            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    managed_node_03            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    managed_node_04            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Note that each managed node is running a different GNU/Linux distribution.

Speed up tip
------------

When we execute a `playbook`_, each `play`_` runs a hidden `task`_, named ``Gathering Facts``. For example,

..  code:: bash

    cd facts && 
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    playbook-with-multi-play.yaml

..  include:: vault-password.rst

returns ::

    PLAY [Display facts] ***********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_02]
    ok: [managed_node_03]
    ok: [managed_node_04]
    ok: [managed_node_01]

    TASK [Display GNU/Linux distribution] ******************************************
    ok: [managed_node_01] => {
        "msg": "Alpine"
    }
    ok: [managed_node_02] => {
        "msg": "Debian"
    }
    ok: [managed_node_03] => {
        "msg": "Ubuntu"
    }
    ok: [managed_node_04] => {
        "msg": "Fedora"
    }

    PLAY [Display more facts] ******************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_02]
    ok: [managed_node_01]
    ok: [managed_node_03]
    ok: [managed_node_04]

    TASK [Display GNU/Linux distribution version] **********************************
    ok: [managed_node_01] => {
        "msg": "3.21.3"
    }
    ok: [managed_node_02] => {
        "msg": "12.10"
    }
    ok: [managed_node_03] => {
        "msg": "25.04"
    }
    ok: [managed_node_04] => {
        "msg": "42"
    }

    PLAY RECAP *********************************************************************
    managed_node_01            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    managed_node_02            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    managed_node_03            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    managed_node_04            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Because of this, a tip to speed up the execution of a `playbook`_ is to disable the ``Gathering Facts`` `task`_ for a `play`_ using the ``gather_facts`` `keyword`_. It is important to remember that the use of a `fact`_ without gathering will result in a failed exection of the `playbook`_. For example,

..  code:: bash

    cd facts && 
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    playbook-without-facts.yaml

..  include:: vault-password.rst

returns ::

    PLAY [Display facts] ***********************************************************

    TASK [Display GNU/Linux distribution] ******************************************
    fatal: [managed_node_01]: FAILED! => {"msg": "The task includes an option with an undefined variable.. 'ansible_distribution' is undefined\n\nThe error appears to be in '/home/ansible/tutorial/facts/playbook-without-facts.yaml': line 6, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n    - name: Display GNU/Linux distribution\n      ^ here\n"}
    fatal: [managed_node_02]: FAILED! => {"msg": "The task includes an option with an undefined variable.. 'ansible_distribution' is undefined\n\nThe error appears to be in '/home/ansible/tutorial/facts/playbook-without-facts.yaml': line 6, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n    - name: Display GNU/Linux distribution\n      ^ here\n"}
    fatal: [managed_node_03]: FAILED! => {"msg": "The task includes an option with an undefined variable.. 'ansible_distribution' is undefined\n\nThe error appears to be in '/home/ansible/tutorial/facts/playbook-without-facts.yaml': line 6, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n    - name: Display GNU/Linux distribution\n      ^ here\n"}
    fatal: [managed_node_04]: FAILED! => {"msg": "The task includes an option with an undefined variable.. 'ansible_distribution' is undefined\n\nThe error appears to be in '/home/ansible/tutorial/facts/playbook-without-facts.yaml': line 6, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n    - name: Display GNU/Linux distribution\n      ^ here\n"}

    PLAY RECAP *********************************************************************
    managed_node_01            : ok=0    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
    managed_node_02            : ok=0    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
    managed_node_03            : ok=0    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
    managed_node_04            : ok=0    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0
