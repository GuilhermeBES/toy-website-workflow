param resourceName string
param location string = resourceGroup().location
param sku string
param customSubDomainName string
param kind string

// Verifica se o OpenAI já existe
var openAIExists = !empty(resourceId('Microsoft.CognitiveServices/accounts', resourceName))

// Se o recurso já existe, usa suas propriedades
resource openAI 'Microsoft.CognitiveServices/accounts@2022-12-01' = if (openAIExists) {
  name: resourceName  
  location: location
  kind: kind                    
  sku: {
    name: sku                          
  }
  properties: {
    customSubDomainName: customSubDomainName
  }
  tags: {
    teste: 'teste'      
  }
}

// Cria o recurso se não existir
resource createOpenAI 'Microsoft.CognitiveServices/accounts@2022-12-01' = if (!openAIExists) {
  name: resourceName  
  location: location
  kind: kind                     
  sku: {
    name: sku                          
  }
  properties: {
    customSubDomainName: customSubDomainName
  }
}

//az deployment group create --resource-group rg-eu2-latam-poc-mlops-dev-001 --template-file OAI.bicep

 