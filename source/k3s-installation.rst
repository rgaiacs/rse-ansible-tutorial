Installation of K3s
===================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`k3s-installation.zip <./examples/k3s-installation.zip>`.

`K3s`_ is a lightweight certified Kubernetes distribution. In this section, you will learn one way to install `K3s`_ using `Ansible`_.

..  note::

    Please read "`Install Script <https://docs.k3s.io/quick-start#install-script>`_" from `K3s`_'s official documentation for other ways to install `K3s`_.

Inventory
---------

..  literalinclude:: examples/k3s-installation/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

Playbook
--------

..  literalinclude:: examples/k3s-installation/playbook.yaml
    :caption: playbook.yml
    :language: yaml

Running
-------

..  code:: bash

    cd k3s-installation
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    playbook.yaml

..  include:: vault-password.rst

returns ::

    PLAY [Configure K3S] ***********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [managed_node_01]

    TASK [Install K3S] *************************************************************
    changed: [managed_node_01]

    PLAY RECAP *********************************************************************
    managed_node_01            : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
