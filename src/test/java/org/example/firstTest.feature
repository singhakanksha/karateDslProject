Feature: sample api test
  Scenario: Test sample get api
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200