param resourceName string
param location string = resourceGroup().location
param sku string
param customSubDomainName string
param kind string


// Verifica se o Speech Service já existe
var speechServiceExists = !empty(resourceId('Microsoft.CognitiveServices/accounts', resourceName))

// Se o recurso já existe, usamos suas propriedades
resource speechService 'Microsoft.CognitiveServices/accounts@2021-04-30' = if (speechServiceExists) {
  name: resourceName  
  location: location
  kind:kind                  
  sku: {
    name: sku                          
  }
  properties: {
    customSubDomainName: customSubDomainName
  }
}

// Cria o recurso se não existir
resource createSpeechService 'Microsoft.CognitiveServices/accounts@2021-04-30' = if (!speechServiceExists) {
  name: resourceName  
  location: location
  kind:kind                     
  sku: {
    name: sku                          
  }
  properties: {
    customSubDomainName: customSubDomainName
  }
}
