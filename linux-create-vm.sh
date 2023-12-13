#!/bin/bash

# A script to build a webserver on linux
if (apt-cache show snapd)
then
  echo "snapd already in apt-cache"
else
  echo "updating apt-cache"
  sudo apt update
fi

if (snap --version)
then
  echo "snap already installed"
else
  echo "installing snap"
  sudo apt install -y snapd
  sleep 2
fi

if (multipass version)
then
  echo "multipass already installed"
else
  echo "installing multipass"
  sudo snap install multipass
  sleep 2
fi

if [ -f ./id_ed25519 ]
then
  echo "ssh key already created"
else
  echo "Creating ssh key pair"
  ssh-keygen -t ed25519 -f "./id_ed25519" -N ''
fi

cat <<-EOF > ./cloud-init.yaml
#cloud-config

users:
  - default
  - name: ${USER}
    ssh_authorized_keys:
      - $(cat ./id_ed25519.pub)
    shell: /bin/bash
    sudo: ALL=(ALL) NOPASSWD:ALL
EOF

# Spinning up an ubuntu vm

if ( multipass info relativepath )
then 
  echo "relativepath vm is running"
else 
  echo "launching a ubuntu vm named relativepath"
  multipass launch --name relativepath --cloud-init cloud-init.yaml
fi

# SSh into virtual machine

scp -i ./id_ed25519 -o StrictHostKeyChecking=no webserver.sh index.html $USER@$(multipass info relativepath | grep IPv4 | awk '{ print $2 }'):~/

ssh -i ./id_ed25519 -o StrictHostKeyChecking=no  $USER@$(multipass info relativepath | grep IPv4 | awk '{ print $2 }')




