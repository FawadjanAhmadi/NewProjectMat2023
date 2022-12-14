Feature: End to End Testing of API
  @e2e
  Scenario: end to end
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * path "api/accounts/add-primary-account"
    * def generator = Java.type("api.test.DataGenerator")
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def dateOfBirth = generator.getDob()
    * def title = generator.getTitle()
    * request
      """
      {
      "email":"#(email)",
      "firstName":"#(firstName)",
      "lastName":"#(lastName)",
      "title":"#(title)",
      "gender":"MALE",
      "maritalStatus":"SINGLE",
      "employmentStatus":"Student",
      "dateOfBirth": "#(dateOfBirth)"
      }
      """
    * method post
    * status 201
    * print response.id
    * def dbresult = Java.type("api.test.DatabaseConnectionUtility")
    * def dbemail = dbresult.result("select * from primary_person where id = '" + response.id +"'", "email" )
    * match dbemail == email
    * def dbFirstname = dbresult.result("select * from primary_person where id = '" + response.id +"'", "first_name" )
    * match dbFirstname == firstName