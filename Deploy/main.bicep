param mgName string = 'myManagementGroup' // Parameter for the name of the management group

resource newMG 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: mgName
  properties: {}
}

output newManagementGroup string = newMG.name // Output to get the name of the created management group
