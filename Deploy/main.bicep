targetScope = 'managementGroup'

param mgName string = 'myManagementGroup'

resource newMG 'Microsoft.Management/managementGroups@2021-04-01' = {
  scope: tenant()
  name: mgName
  properties: {}
}

output newManagementGroup string = mgName
