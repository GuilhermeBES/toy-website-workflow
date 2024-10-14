param accountName string
param location string
param pricingTier string
param kind string

resource account 'Microsoft.Maps/accounts@2023-06-01' = {
  name: accountName
  location: location
  sku: {
    name: pricingTier
  }
  kind: kind
}

//az deployment group create --resource-group rg-eu2-latam-poc-mlops-dev-001 --template-file map.bicep --parameters C:\Users\Guilherme\Documents\Trampo\Biceps\infrastructure\parameters\map-upbi.params.json
