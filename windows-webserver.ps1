# powershell script to build a webserver.

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
  choco install -y git.install --params "'/GitAndUnixToolsOnPath /WindowsTerminal'"
}


if ( Test-Path .\id_ed25519 -PathType Leaf){
  Write-Host "ssh key already created"
}
else{
  Write-Host "Creating ssh key pair"
  ssh-keygen -t ed25519 -f "./id_ed25519" -N ''
}

if ( get-command multipass )
{
  write-host "multipass already installed"
}
else
{
  write-host "installing multipass"
  choco install -y choco install virtualbox multipass --params="'/HyperVisor:VirtualBox'"
}

multipass launch --name relativepath
multipass shell relativepath
