@maxlength(11)
param storageAccountPrefix string = 'bicep'
param location string = resourceGroup().location

var sta = '${storageAccountPrefix}${(uniqueString)(subscription().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: sta
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
