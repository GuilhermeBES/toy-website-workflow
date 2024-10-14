param storageAccountName string 
param location string = resourceGroup().location
param skuName string
param kind string 
param accessTier string
 
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: kind
  properties: {
    accessTier: accessTier
  }
}


//az deployment group create --resource-group rg-chatbotsac-dev-eastus-001 --template-file storageaccount.bicep --parameters @/Users/jeff/Documents/Github/Biceps/infrastructure/parameters/sa-upbi.params.json
//
//az deployment group create --resource-group rg-eu2-latam-poc-mlops-dev-001 --template-file storageaccount.bicep --parameters @/Users/jeff/Documents/Github/Biceps/infrastructure/parameters/sa-upbi.params.json
