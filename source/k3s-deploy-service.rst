Deploy Service to K3s
=====================

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`k3s-deploy-service.zip <./examples/k3s-deploy-service.zip>`.

`K3s`_ is a lightweight certified Kubernetes distribution. In :doc:`k3s-installation`, you learned one way to install `K3s`_ using `Ansible`_. In this section, you will learn how to use `Ansible`_ to managed a `K3s`_ cluster.

..  important::

    The configuration of the Kubernetes cluster will probably change less often than the services running on the Kubernetes cluster. Because of this, it is better to have one `playbook`_ for the installation and configuration of the Kubernetes cluster and **another** `playbook`_ for the services running on the Kubernetes cluster.

..  include:: k3s-preparation.rst

Inventory
---------

..  literalinclude:: examples/k3s-deploy-service/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

The above `inventory`_ **only** defines that is the same as the `Ansible control node`_.

Playbook
--------

..  literalinclude:: examples/k3s-deploy-service/playbook.yaml
    :caption: playbook.yml
    :language: yaml

The above `playbook`_ has four `tasks <task>`_:

1.  collect information about the Kubernetes cluster.
2.  print some of the previously collected information about the Kubernetes cluster.
3.  create a new namespace called ``tutorial``.
4.  create a new deployment that consist of one container running NGIX. 

Running
-------

..  code:: bash

    cd k3s-deploy-service
    ansible-playbook \
    -i inventories/production.yml \
    playbook.yaml

returns ::

    PLAY [Configure K3s] ***********************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [localhost]

    TASK [Get Cluster information] *************************************************
    ok: [localhost]

    TASK [Print Cluster information] ***********************************************
    ok: [localhost] => {
        "msg": {
            "client": "31.0.0",
            "server": {
                "kubernetes": {
                    "buildDate": "2025-07-21T18:57:33Z",
                    "compiler": "gc",
                    "gitCommit": "071b1ead43641c6803e0b9fce6473baeb12357cf",
                    "gitTreeState": "clean",
                    "gitVersion": "v1.30.14-rc1+k3s2",
                    "goVersion": "go1.23.10",
                    "major": "1",
                    "minor": "30",
                    "platform": "linux/amd64"
                }
            }
        }
    }

    TASK [Create a k8s namespace] **************************************************
    changed: [localhost]

    TASK [Create a Deployment object] **********************************************
    changed: [localhost]

    PLAY RECAP *********************************************************************
    localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
