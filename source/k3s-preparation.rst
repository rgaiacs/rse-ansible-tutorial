Preparation
-----------

Access to a Kubernetes cluster is done using `kubectl`_ instead of `SSH`_. For authentication, a `kubeconfig`_ file is used. The `kubeconfig`_ file is created when installing the Kubernetes cluster and you will have to copied it to the proxy (where `kubectl`_ will run) used by Ansible. You can use as proxy:

1.  the `Ansible control node`_.
2.  the `Kubernetes control plane`_.
3.  another machine with `kubectl`_ and `kubeconfig`_.

For this section, you will use `Ansible control node`_ and you will have to copy the `kubeconfig`_.

..  code:: bash

    docker compose cp k3s:/etc/rancher/k3s/k3s.yaml k3s-config
    sed -i 's/127.0.0.1/kubernetes/g' k3s-config
    docker compose cp k3s-config control-node:/home/ansible/.kube/config
