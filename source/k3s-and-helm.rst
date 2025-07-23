Deploy Service to K3s with Helm
===============================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`k3s-and-helm.zip <./examples/k3s-and-helm.zip>`.

In :doc:`k3s-deploy-service`, you learn how to manipulate `Kubernetes`_ objects using `Ansible`_'s wrap around `kubectl`_. Another option to manipulate `Kubernetes`_ objects is using `Ansible`_'s wrap around `Helm`_.
`Helm`_ is a popular package manager for Kubernetes. The advantages of using `Helm`_ are:

1.  many softwares have already being package.
2.  is possible to customise the packages to be installed.
3.  remove packages is a single operation.

..  include:: k3s-preparation.rst

Inventory
---------

..  literalinclude:: examples/k3s-and-helm/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

The above `inventory`_ **only** defines that is the same as the `Ansible control node`_.

Playbook
--------

..  literalinclude:: examples/k3s-and-helm/playbook.yaml
    :caption: playbook.yml
    :language: yaml

The above `playbook`_ has two `tasks <task>`_:

1.  add a Helm repository.
2.  install a Helm chart. 

Running
-------

..  code:: bash

    cd k3s-and-helm
    ansible-playbook \
    -i inventories/production.yml \
    playbook.yaml

returns ::

    PLAY [Deploy Kubernetes Dashboard] *********************************************

    TASK [Gathering Facts] *********************************************************
    ok: [localhost]

    TASK [Add a repository] ********************************************************
    changed: [localhost]

    TASK [Deploy Kubernetes Dashboard] *********************************************
    changed: [localhost]

    PLAY RECAP *********************************************************************
    localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
