$resourceGroupName = 'davidbourkerg02'
$appServicePlanName = 'davidbourkeap02'
$webappName = 'davidbourkewebapp02'
$location = 'UK South'

#Login-AzureRmAccount
<#
$subscription = Get-AzureRmSubscription

Set-AzureRmContext -SubscriptionId $subscription[0].Id

New-AzureRmResourceGroup -Name $resourceGroupName -Location $location

New-AzureRmAppServicePlan -Name $appServicePlanName -Location $location -ResourceGroupName $resourceGroupName `
-Tier Free

New-AzureRmWebApp -ResourceGroupName $resourceGroupName -AppServicePlan $appServicePlanName -Location $location `
-Name $webappName
#>

$webAppObj = Get-AzureRmWebApp -ResourceGroupName $resourceGroupName -Name $webappName

$appSettings = $webAppObj.SiteConfig.AppSettings