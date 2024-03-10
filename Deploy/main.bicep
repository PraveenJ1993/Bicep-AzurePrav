targetScope = 'tenant'

param parentManagementGroupName string = 'NonProduction'
param childManagementGroupName string = 'SecretRND'

resource parentManagementGroup 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: parentManagementGroupName
  properties: {
    displayName: 'Non-production'
  }
}

resource childManagementGroup 'Microsoft.Management/managementGroups@2020-05-01' = {
  name: childManagementGroupName
  properties: {
    displayName: 'Secret R&D Projects'
  }
}
