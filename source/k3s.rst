Kubernetes
==========

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`k3s.zip <./examples/k3s.zip>`.

Inventory
---------

..  literalinclude:: examples/k3s/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

Playbook
--------

..  literalinclude:: examples/k3s/playbook.yaml
    :caption: playbook.yml
    :language: yaml

Running
-------

..  code:: bash

    cd k3s
    ansible-playbook \
    --ask-vault-pass \
    -i inventories/production.yml \
    --extra-vars @vault/production \
    playbook.yaml

..  include:: vault-password.rst

returns ::
