Feature: Verify TEK insurance Token


Background:
Given url "https://tek-insurance-api.azurewebsites.net"
* def token = call read("GenerateToken.feature")
* def tokenValue = token.response.token
* path "/api/token"
* param token = tokenValue

@Token
Scenario: Verify Valid token
* param token = tokenValue
* param username = "supervisor"
* method get
* print response
