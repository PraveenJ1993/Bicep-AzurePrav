param resourceGroupName string = 'myResourceGroup'
param location string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceTestGroupName
  location: 'East US'
  properties: {}
}
