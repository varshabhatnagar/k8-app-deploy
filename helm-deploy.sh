#!/usr/bin/env bash

set -euo pipefail

aws eks update-kubeconfig --name "condenast-eks-cluster" --region us-east-1
helm upgrade \
--install \
--wait \
--reuse-values \
--history-max=5 \
--timeout 30m0s \
"helloworld-release" ./helm

export SERVICE_IP=$(kubectl get svc --namespace default helloworld-release --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
sleep 10
export HELLOWORLD_APP="$(eval echo $SERVICE_IP:80)"
echo "You may access the HelloWorld App using http://$HELLOWORLD_APP"


