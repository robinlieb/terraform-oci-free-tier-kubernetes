#!/bin/bash

set -euxo pipefail

node_ip=$(ip -o -4 addr list enp0s6 | awk '{print $4}' | cut -d/ -f1)
echo KUBELET_EXTRA_ARGS="--node-ip $node_ip --cloud-provider=external --provider-id=${instanceID}" | sudo tee /etc/default/kubelet