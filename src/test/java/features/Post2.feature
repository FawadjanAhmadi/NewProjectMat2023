Feature: Post2

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * path "api/accounts/add-primary-account"

  @Posr2
  Scenario: Post2
    * request
      """
      {
        "email": "SabirAli@yahoo.com",
        "firstName": "Baber",
        "lastName": "Ali",
        "title": "Mr",
        "gender": "FEMALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Employed",
        "dateOfBirth": "1988-06-02",
      }
      """
    * method post
    * status 201
    * print response
    
    
    @Faker
  Scenario: post request with faker data
    * def generator = Java.type("api.test.DataGenerator")
    * def email = generator.getEmail()
    * def firstname = generator.getFirstname()
    * def lastname = generator.getlasttname()
    * def dateofbirth = generator.getDob()
    * request
      """
      {
      "email": "#(email)",
      "firstName": "#(firstname)",
      "lastName": "#(lastname)",
      "title": "Mr",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "Employed",
      "dateOfBirth": "#(dateofbirth)"
      }
      """
    * method post
    * status 201
    * print response
   * match response.firstName == "#(firstname)"
