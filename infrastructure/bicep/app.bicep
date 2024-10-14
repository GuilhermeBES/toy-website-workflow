param resourceName string 
param location string = resourceGroup().location
param existingAppServicePlan string
 
// Criar o Serviço de Aplicativo usando um Plano de Serviço de Aplicativo existente
resource appApp 'Microsoft.Web/sites@2022-03-01' = {
  name: resourceName
  location: location
  properties: {
    serverFarmId: existingAppServicePlan
  }
}

//az deployment group create --resource-group rg-eu2-latam-poc-mlops-dev-001 --template-file app.bicep --parameters @C:\Users\Guilherme\Documents\Trampo\Biceps\infrastructure\parameters\app-upbi.params.json
