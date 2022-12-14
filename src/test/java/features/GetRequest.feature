Feature: get Requst

@Get
Scenario: get Account Requst
Given url "https://tek-insurance-api.azurewebsites.net"
* def token = call read("GenerateToken.feature")
* def tokenValue = token.response.token
* header Authorization = "Bearer " + tokenValue
*  path "/api/accounts/get-primary-account"
* param primaryPersonId = 2931
* request
"""
{
  "id": 0,
  "phoneNumber": "0000066000",
  "phoneExtension": "000",
  "phoneTime": "All",
  "phoneType": "telelele"
}
""" 
* method get
* print response
* status 200
* def idValue = response.id
* match idValue == 2931



