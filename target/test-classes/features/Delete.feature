Feature: delete

@Delete
Scenario: delete account
Given url "https://tek-insurance-api.azurewebsites.net"
* def token = call read("GenerateToken.feature")
* def tokenValue = token.response.token
* header Authorization = "Bearer " + tokenValue
* path "/api/accounts/delete-account"
* param primaryPersonId = 4311
* method delete
* status 200
* print response
