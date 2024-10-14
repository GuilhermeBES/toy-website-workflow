param resourceName string
param location string = resourceGroup().location
param publisherEmail string
param publisherName string
param skuName string
param skuCount int

var apiManagementExists = !empty(resourceId('Microsoft.ApiManagement/service', resourceName))

resource apiManagement 'Microsoft.ApiManagement/service@2021-08-01' = if (apiManagementExists) {
  name: resourceName
  location: location
  
  sku: {
    name: skuName
    capacity: skuCount
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
  }
}

resource createApiManagement 'Microsoft.ApiManagement/service@2021-08-01' = if (!apiManagementExists) {
  name: resourceName
  location: location
  
  sku: {
    name: skuName
    capacity: skuCount
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName 
  }
}

 
//az deployment group create --resource-group rg-eu2-latam-poc-mlops-dev-001 --template-file apim.bicep --parameters /Users/yaraparra/Biceps/infrastructure/parameters/apim-upbi.params.json

