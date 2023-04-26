Feature: config demo feature
  Background:
    * url baseURL
    * header Accept = "application/json"
  Scenario:  get api scenario with full url
    Given path "/users?page=2"
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies