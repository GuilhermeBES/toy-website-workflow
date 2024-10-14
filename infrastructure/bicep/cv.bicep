param resourceName string
param skuName string
param location string = resourceGroup().location
param kind string


// Verifica se o Computer Vision já existe
var computerVisionExists = !empty(resourceId('Microsoft.CognitiveServices/accounts', resourceName))

// Se o recurso já existe, usamos suas propriedades
resource computerVision 'Microsoft.CognitiveServices/accounts@2022-12-01' = if (computerVisionExists) {
  name: resourceName
  location: location
  kind: kind
  sku: {
    name: skuName
  }
  properties: {
    apiProperties: {}
  }
}

// Cria o recurso se não existir
resource createComputerVision 'Microsoft.CognitiveServices/accounts@2022-12-01' = if (!computerVisionExists) {
  name: resourceName
  location: location
  kind: kind
  sku: {
    name: skuName
  }
  properties: {
    apiProperties: {}
  }
}

//az deployment group create --resource-group rg-chatbotsac-dev-eastus-001 --template-file cv.bicep --parameters C:\Users\Guilherme\Documents\Trampo\Biceps\infrastructure\parameters\cv-upbi.params.json
