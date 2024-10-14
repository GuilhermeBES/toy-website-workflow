param location string = resourceGroup().location
param workspace string
param managedResourceGroupName string
param defaultDataLakeStorageAccountUrl string
param defaultDataLakeStorageFilesystem string 
param identityType string 

resource synapse 'Microsoft.Synapse/workspaces@2021-06-01' = {  
  name: workspace
  location: location
  identity: {
    type: identityType
  }
  properties: {
    managedResourceGroupName: managedResourceGroupName
    defaultDataLakeStorage: {
      accountUrl: defaultDataLakeStorageAccountUrl
      filesystem: defaultDataLakeStorageFilesystem 
    }
  }
}


//az deployment group create --resource-group rg-eu2-latam-poc-mlops-dev-001 --template-file synw.bicep --parameters C:\Users\Guilherme\Documents\Trampo\Biceps\infrastructure\parameters\synw-upbi.params.json
