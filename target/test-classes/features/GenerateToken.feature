Feature: Generate Token

@Token
Scenario:
Given url "https://tek-insurance-api.azurewebsites.net"
* path "/api/token"
* request {"username":"Supervisor","password":"tek_supervisor"}
* method post
* print response
