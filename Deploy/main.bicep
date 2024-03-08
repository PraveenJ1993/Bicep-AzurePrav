targetScope = 'managementGroup'

param mgName string = 'myManagementGroup'

resource newMG 'Microsoft.Management/managementGroups@2021-04-01' = {
  scope: tenant()
  properties: {}
}

# Optional output for reference (consider using newMG.id directly)
output newManagementGroupId string = newMG.id
