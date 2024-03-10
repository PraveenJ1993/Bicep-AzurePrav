targetScope = 'tenant'

param newManagementGroupName string = 'YourNewManagementGroup'

resource newManagementGroup 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: newManagementGroupName
  location: 'global'
}
