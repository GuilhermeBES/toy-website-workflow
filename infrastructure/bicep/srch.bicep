param resourceName string
param skuName string
param location string = resourceGroup().location
param hostingMode string
param partitionCount int
param replicaCount int

resource searchService 'Microsoft.Search/searchServices@2020-08-01' = {
  name: resourceName
  location: location
  sku: {
    name: skuName
  }
  properties: {
    hostingMode: hostingMode
    partitionCount: partitionCount
    replicaCount: replicaCount
  }
}

//az deployment group create --resource-group rg-eu2-latam-poc-mlops-dev-001 --template-file srch.bicep --parameters @C:\Users\Guilherme\Documents\Trampo\Biceps\infrastructure\parameters\srch-upbi.params.json
