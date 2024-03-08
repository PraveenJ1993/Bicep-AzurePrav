param mgName string = 'mg-${uniqueString(newGuid())}'

resource newMG 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: mgName
  properties: {}
}

output newManagementGroup string = newMG.name
