#!/bin/bash
#Download the latest release with the command:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#Download the kubectl checksum file:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

#Validate the kubectl binary against the checksum file:
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

#If valid, the output is:
#kubectl: OK

#Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#detailed view of version:
kubectl version --client --output=yaml
