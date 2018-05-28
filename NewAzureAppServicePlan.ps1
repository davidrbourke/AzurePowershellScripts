#Login-AzureRmAccount

help New-AzureRmWebApp

help New-AzureRmAppServicePlan

New-AzureRmAppServicePlan -Location UKSouth -Tier Basic -Name MyAppSP -ResourceGroupName rg1

Get-AzureRmAppServicePlan -Name MyAppSP

New-AzureRmWebApp -Name davidbourke01website -AppServicePlan MyAppSP