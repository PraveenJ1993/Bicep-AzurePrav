@description('The Azure region into which the resources should be deployed.')
param location string = 'eastus'

@description('The type of environment. This must be nonprod or prod.')
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

@description('A unique suffix to add to resource names that need to be globally unique.')
@maxLength(13)
param resourceNameSuffix string = 'defaultSuffix'

var toyManualsStorageAccountName = 'toyweb${resourceNameSuffix}'

// Define the SKUs for each component based on the environment type.
var environmentConfigurationMap = {
  nonprod: {
    toyManualsStorageAccount: {
      sku: {
        name: 'Standard_LRS'
      }
    }
  }
  prod: {
    toyManualsStorageAccount: {
      sku: {
        name: 'Standard_ZRS'
      }
    }
  }
}

resource toyManualsStorageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: toyManualsStorageAccountName
  location: location
  kind: 'StorageV2'
  sku: environmentConfigurationMap[environmentType].toyManualsStorageAccount.sku
}
