Feature: GET api test
  Background:
    * url "https://reqres.in/api"
    * header Accept = "application/json"
  Scenario:  get api scenario with full url
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  Scenario:  get api scenario without full url
    Given path "/users?page=2"
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  Scenario:  get api scenario with params
    Given path "/users"
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  Scenario:  get api scenario with assertions
    Given path "/users"
    And param page = 2
    When method GET
    Then status 200
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[1].id == 8
    And match $.data[3].last_name == 'Fields'