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
