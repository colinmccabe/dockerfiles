#!/bin/sh

export KUBECONFIG=$(echo -n /home/appuser/.kube/config* | tr ' ' ':')

stern --tail=0 "$@"
