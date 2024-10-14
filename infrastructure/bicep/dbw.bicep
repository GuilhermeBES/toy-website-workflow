param location string = resourceGroup().location
param workspace string
param sku string
param managedResourceGroupId string



resource databricksWorkspace 'Microsoft.Databricks/workspaces@2023-02-01' = if (!empty(workspace)) {
  name: workspace
  location: location
  sku: {
    name: sku
  }
  properties: {
    managedResourceGroupId: managedResourceGroupId
    
  }
}

//az deployment group create --resource-group rg-eu2-latam-poc-mlops-dev-001 --template-file dbw.bicep --parameters dbw-upbi.params.json
