Feature: POST Api demo
  Background:
    * url "https://reqres.in"
    * header Accept = "application/json"
    * def expectedOutput = read("response1.json")
    * def requestBody = read("request1.json")
  Scenario: Post request with body
    Given path "/api/users"
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And print response

    Scenario: Post request with assertions
      Given path "/api/users"
      And request {"name": "morpheus","job": "leader"}
      When method POST
      Then status 201
      And match response == {"createdAt":"#ignore","name":"morpheus","id":"#string","job":"leader"}

  Scenario: Post request get response from file
    Given path "/api/users"
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput

  Scenario: Post request read request from file
    Given path "/api/users"
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput

  Scenario: Post request - change request before sending
    Given path "/api/users"
    And set requestBody.job = 'engineer'
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput.jo
    And match $ == expectedOutput