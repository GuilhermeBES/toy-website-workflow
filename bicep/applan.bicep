param resourceName string 
param location string = resourceGroup().location
param skuName string
param skuCapacity int


resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: resourceName
  location: location
  sku: {
    name: skuName
    capacity: skuCapacity
    
  }
}

//az deployment group create --resource-group rg-eu2-latam-poc-mlops-dev-001 --template-file applan.bicep --parameters /Users/yaraparra/Biceps/infrastructure/parameters/applan-upbi.params.json
