@description('List of preferred regions for the deployment.')
param preferredRegions array = [
  'eastus'
  'westeurope'
  'centralus'
]

@description('The environment type (prod or nonprod).')
@allowed([
  'prod'
  'nonprod'
])
param environmentType string

@description('A unique suffix for resource names.')
param resourceNameSuffix string = uniqueString(resourceGroup().id)

var selectedRegion = first(preferredRegions)

var appServiceAppName = 'toy-website-${resourceNameSuffix}'
var appServicePlanName = 'toy-website-plan'
var toyManualsStorageAccountName = 'toyweb${resourceNameSuffix}'

var environmentConfigurationMap = {
  nonprod: {
    appServicePlan: {
      sku: {
        name: 'F1'
        capacity: 1
      }
    }
    toyManualsStorageAccount: {
      sku: {
        name: 'Standard_LRS'
      }
    }
  }
  prod: {
    appServicePlan: {
      sku: {
        name: 'S1'
        capacity: 2
      }
    }
    toyManualsStorageAccount: {
      sku: {
        name: 'Standard_ZRS'
      }
    }
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: selectedRegion
  sku: environmentConfigurationMap[environmentType].appServicePlan.sku
}

resource appServiceApp 'Microsoft.Web/sites@2023-12-01' = {
  name: appServiceAppName
  location: selectedRegion
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      appSettings: [
        {
          name: 'ToyManualsStorageAccountConnectionString'
          value: 'DefaultEndpointsProtocol=https;AccountName=${toyManualsStorageAccountName};...'
        }
      ]
    }
  }
}

resource toyManualsStorageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: toyManualsStorageAccountName
  location: selectedRegion
  kind: 'StorageV2'
  sku: environmentConfigurationMap[environmentType].toyManualsStorageAccount.sku
}
