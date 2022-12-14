Feature: update info

@Update
Scenario: update info
Given url "https://tek-insurance-api.azurewebsites.net"
* def token = call read("GenerateToken.feature")
* def tokenValue = token.response.token
* header Authorization = "Bearer " + tokenValue
* path "/api/accounts/update-account-phone"
* param primaryPersonId = 4311
* request
"""
{
  "id": 0,
  "phoneNumber": "9166703633",
  "phoneExtension": "321",
  "phoneTime": "Alltime",
  "phoneType": "Celll"
}
"""
* method put
* status 200
* print response
