# Relativepath Cycle 6

## Project Requirements

* A nginx web server
	* serving default web page
* A fully updated and upgraded ubuntu server 22.04 LTS
* target x86_64 architecture
* fully automated in shell scripts
* local dev environment in multipass VM 
* fully documented process (THE BEST)

## Dependencies

- ubuntu server 22.04 LTS
- hypervisor: multipass (virtualbox, QEMU)
- web server (nginx)
- package manager (apt, brew, chocolatey)
- text editor (nano)

## Usage
First we create a vm. using our create script. second we deploy our webserver script.
The create and destroy vm scripts are divided by operating system.

### Create vm

Mac:

`zsh darwin-create-vm.sh`

Linux:

`bash linux-create-vm.sh` 

Windows: 

`set-executionpolicy bypass -scope process -force; .\windows-create-vm.ps1`

## Deploy webserver in the VM

`bash webserver.sh`

### Test webserver
on the VM
`curl localhost`

from your local workstation (not the VM)
open http://VMIP in your browser

## Destroy VM
Mac
`zsh destroy-vm.sh`

Linux
`bash destroy-vm.sh`

Windows
`./destroy-vm.ps1`
