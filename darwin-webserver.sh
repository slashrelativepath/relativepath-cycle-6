# A script to build webserver

if (which brew)
then
echo "brew is installed"
else
echo "installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# monitor with htop

if (which htop)
then
echo "htop is installed"
else
echo "installing htop"
brew install htop
fi

# nano for text editing

if (which nano)
then 
 echo "nano is installed"
else
 echo "installing nano"
brew install nano
fi

# install hypervisor

if (multipass version)
then
 echo "multipass is installed"
else
 echo "installing multipass"
 brew install multipass
fi

if [ -f ./id_ed25519 ]
then
  echo "ssh key already created"
else
  echo "Creating ssh key pair"
  ssh-keygen -t ed25519 -f "./id_ed25519" -N ''
fi

# Spinning up an ubuntu vm

if ( multipass info relativepath )
then 
  echo "relativepath vm is running"
else 
  echo "launching a ubuntu vm named relativepath"
  multipass launch --name relativepath --cloud-init cloud-init.yaml
fi

# SSh into virtual machine

ssh -i ./id_ed25519 harmony@$(multipass info relativepath | grep IPv4 | awk '{ print $2 }')

# Install nginx on virtual machine

# Test webserver






