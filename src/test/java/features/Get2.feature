Feature: Get InFo

@Get2
Scenario: Get info personal
Given url "https://tek-insurance-api.azurewebsites.net"
* def token = call read("GenerateToken.feature")
* def tokenValue = token.response.token
* header Authorization = "Bearer " + tokenValue
* path "/api/accounts/get-primary-account"
* param primaryPersonId = 4311
* method get
* print response
* status 200
* def name = response.id
* match id == 4311

