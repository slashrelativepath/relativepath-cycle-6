# ''' desc:posh-git is a PowerShell module that integrates Git and PowerShell 
by providing Git status summary information 
that can be displayed in the PowerShell prompt'''
#installation process via (chocalatey.

#1.PSVersion must be PS 5.x or 6.0 for windows.
$PSVersionTable.PSVersion
#2.Check the script execution policy.
Get-ExecutionPolicy
#3.script execution policy must be set to either RemoteSigned or Unrestricted
# If the policy is not set to one of the two required values, run PowerShell as Administrator and execute.
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm.
#installing via chocalatey
choco install poshgit
#congrats brother you've installed posh-git
 
