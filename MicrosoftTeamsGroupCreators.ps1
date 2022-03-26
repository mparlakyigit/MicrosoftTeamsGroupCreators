<#
.HAKKIMDA
	Mehmet PATLAKYİĞİT | Office Apps & Services MVP
	www.parlakyigit.net
	Twitter:@mparlakyigit 
#>

#Kullanıcıların Microsoft Teams Üzerinde takım oluşturmasını engelleme
#https://www.parlakyigit.net/microsoft-teams-kullanicilarinin-takim-olusturmasini-engelleyin/


Install-Module -Name ExchangeOnlineManagement
Set-ExecutionPolicy Unrestricted
Get-ExecutionPolicy
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline


New-DistributionGroup -Name "Teams Admins" -Alias TeamsAdmins -DisplayName "Teams Admins" -Type Security -Members @("Test One","Test Two")


#Code Source https://docs.microsoft.com/en-us/microsoft-365/solutions/manage-creation-of-groups?view=o365-worldwide#step-2-run-powershell-commands

Uninstall-Module AzureAD
Install-Module AzureADPreview


#Code Source https://docs.microsoft.com/en-us/microsoft-365/solutions/manage-creation-of-groups?view=o365-worldwide#step-2-run-powershell-commands
$GroupName = "Teams Admins"
$AllowGroupCreation = $False

Connect-AzureAD

$settingsObjectID = (Get-AzureADDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id
if(!$settingsObjectID)
{
    $template = Get-AzureADDirectorySettingTemplate | Where-object {$_.displayname -eq "group.unified"}
    $settingsCopy = $template.CreateDirectorySetting()
    New-AzureADDirectorySetting -DirectorySetting $settingsCopy
    $settingsObjectID = (Get-AzureADDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id
}

$settingsCopy = Get-AzureADDirectorySetting -Id $settingsObjectID
$settingsCopy["EnableGroupCreation"] = $AllowGroupCreation

if($GroupName)
{
  $settingsCopy["GroupCreationAllowedGroupId"] = (Get-AzureADGroup -SearchString $GroupName).objectid
} else {
$settingsCopy["GroupCreationAllowedGroupId"] = $GroupName
}
Set-AzureADDirectorySetting -Id $settingsObjectID -DirectorySetting $settingsCopy

(Get-AzureADDirectorySetting -Id $settingsObjectID).Values
