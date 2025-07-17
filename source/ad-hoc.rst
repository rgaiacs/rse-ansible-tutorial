Ad hoc
======

..  include:: sandbox-callout.rst

..  tip::

    All the files from this section are in :download:`ad-hoc.zip <./examples/ad-hoc.zip>`.


In :doc:`hello-world`, we saw how `Ansible`_ facilitate the repetition of tasks. Before we get into more details and features, we will see how `Ansible`_ can help with tasks that **often** only done once, for example, upgrade the operating system. 

Inventory
---------

This is the same used in :doc:`hello-world`.

..  literalinclude:: examples/ad-hoc/inventories/production.yml
    :caption: inventories/production.yml
    :language: yaml

The above `inventory`_ has a single group called ``web`` that has a single managed node called ``managed_node_01`` and the connection details. 

Running
-------

..  code:: bash

    cd ad-hoc
    ansible \
    web \
    -i inventories/production.yml \
    --ask-become-pass \
    --become \
    -m ansible.builtin.command \
    -a 'apk update'

returns ::

    managed_node_01 | CHANGED | rc=0 >>
    fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/APKINDEX.tar.gz
    fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/community/x86_64/APKINDEX.tar.gz
    v3.21.3-659-g65d7de3fa8a [https://dl-cdn.alpinelinux.org/alpine/v3.21/main]
    v3.21.3-657-gfc00cab06e0 [https://dl-cdn.alpinelinux.org/alpine/v3.21/community]
    OK: 25401 distinct packages available
