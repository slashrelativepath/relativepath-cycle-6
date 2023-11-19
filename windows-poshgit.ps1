# Idempotent script that installs poshgit and it's dependecies
# This script must be run as administrator


if ( get-command choco)
{
  echo "Chocolatey already installed"
}
else
{
  echo "Installing chocolatey"
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.servicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}


# git should be installed

if (get-command git)
{
  echo "chocolatey already installed"
}
else
{ 
  echo "Installing git"
  choco install git.install -y --params "'/GitAndUnixToolsOnPath /WindowsTerminal /NoAutoCrlf'"  
}


# poshgit should be installed

if (get-command poshgit)
{ 
  echo "poshgit already installed"
}
else
{
  echo "installing poshgit"
  choco install poshgit
}


