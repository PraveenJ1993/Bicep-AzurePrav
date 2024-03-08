param location string = resourceGroup().location

param environmentType string

param resourceNameSuffix string = uniqueString(resourceGroup().id)

var toyManualsStorageAccountName = 'toyweb${resourceNameSuffix}'

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

resource managementGroup 'Microsoft.Management/managementGroups@2021-04-01-preview' = {
  name: 'TestManagementGroup'
  properties: {}
}

resource managementResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'managementResourceGroup'
  location: location
  properties: {
    parentManagementGroupId: managementGroup.id
  }
}

resource toyManualsStorageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: toyManualsStorageAccountName
  location: location
  kind: 'StorageV2'
  sku: environmentConfigurationMap[environmentType].toyManualsStorageAccount.sku
  properties: {
    accessTier: 'Hot'
  }
  dependsOn: [
    managementResourceGroup
  ]
}

output toyManualsStorageAccountConnectionString string = concat('DefaultEndpointsProtocol=https;AccountName=', toyManualsStorageAccount.name, ';EndpointSuffix=', environment().suffixes.storage, ';AccountKey=', listKeys(toyManualsStorageAccount.id, environment().suffixes.storage).keys[0].value)
