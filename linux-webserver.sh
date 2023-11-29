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

