# powershell script to build a webserver.
<#
  Function to get the name of the wifi interface that multipass is able to integrate with.
  Precondition: 
    Must have an UP&RUNNING wifi interface. This isn't fancy enough to go thru
    all your intefaces and chose the best one...yet.
  Postcondition:
    Returns the wifi interface name, or an empty string if you ignored the precondition.
#>
Function Get-Wifi-Network{
  return multipass networks --format yaml | grep wifi -B 1 | awk -F: 'NR==1{print "$1"}'
}
$flags=''
if ( get-command choco )
{
  write-host "choco already installed"
}
else
{
  write-host "installing choco"
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

if ( get-command nano )
{
  write-host "nano already installed"
}
else
{
  write-host "installing nano"
  choco install -y nano
}


if ( get-command git )
{
  write-host "git already installed"
}
else
{
  write-host "installing git"
  choco install git.install -y --params "'/GitAndUnixToolsOnPath /WindowsTerminal /NoAutoCrlf'" --force
}

if ( get-command jq )
{
  write-host "jq already installed"
}
else
{
  write-host "installing jq"
  choco install -y jq
}

if ( Test-Path ./id_ed25519 -PathType Leaf){
  Write-Host "ssh key already created"
}
else{
  Write-Host "Creating ssh key pair"
  Write-Host "y" | ssh-keygen -t ed25519 -f "./id_ed25519" -N `"`"
}

@"
#cloud config
users:
  - default
  - name: $env:username
    ssh_authorized_keys:
      - $(cat ./id_ed25519.pub)
    shell: /bin/bash
    sudo: ALL=(ALL) NOPASSWD:ALL
"@ > cloud-init.yaml

if ( get-command multipass )
{
  write-host "multipass already installed"
}
else
{
  write-host "installing multipass"
  choco install -y choco install virtualbox multipass --params="'/HyperVisor:VirtualBox'"
}

# launch vm
if (( $(multipass get local.driver) -eq "virtualbox")) {
  $network=Get-Wifi-Network
  multipass set local.bridged-network=$network

  Start-Sleep 5
  refreshenv
  $flags="--bridged"
}
if ( multipass info relativepath )
{
  write-host "relativepath vm already exists."
}
else
{
  write-host "creating relativepath vm!"
  multipass launch --name relativepath --cloud-init cloud-init.yaml $flags
}

# copy nginx config file over to the remote vm
scp -i ./id_ed25519 -o StrictHostKeyChecking=no nginx.sh $env:username@$(multipass list --format json | jq -re '.list[].ipv4[]'):~/

# connect to vm via ssh
ssh -i ./id_ed25519 -o StrictHostKeyChecking=no $env:username@$(multipass list --format json | jq -re '.list[].ipv4[]')
