# Connect-AzureRmAccount
# Get-AzureRmSubscription
# Select-AzureSubscription -SubscriptionName <String>

$resourceGroup = 'rg1'
$location = 'UK South'
$vmName = 'vmDrb1'
$storageName = 'vmdrbst1'

# Need to know: Takes local config script, zips it, uploads it to storage account
Publish-AzureRmVmDscConfiguration `
-ConfigurationPath .\WindowsWebServer.ps1 `
-ResourceGroupName $resourceGroup `
-StorageAccountName $storageName -Force


# Need to know: Installs the Dsc agent, and run the Dsc update
Set-AzureRmVmDscExtension -Version 2.21 `
-ResourceGroupName $resourceGroup `
-VMName $vmName `
-ArchiveStorageAccountName $storageName `
-ArchiveBlobName WindowsWebServer.ps1.zip `
-AutoUpdate:$true `
-ConfigurationName IIS