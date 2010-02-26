Feature: global settings storage
  In order to store global configuration settings
  As a user
  I want to save and retrieve global configuration settings

  Scenario: Saving and retrieving global values
    Given I entered email me@here.com into the storage
    When I retrieve email
    Then the result should be me@here.com
    
    