#!/bin/bash

# A script to build a webserver on linux

if (multipass version)
then
  echo "multipass already intall"
else
  echo "install multipass"
  sudo snap install -y multipass
fi

