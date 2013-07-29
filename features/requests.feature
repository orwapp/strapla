Feature: Create a new request
  In order to get help
  As a visitor to the page
  I want to be able to post my request for help

  Background:
    Given I have a the expert "expert@coderunner.co" with password "not_gonna_get_it"
    And user "expert@coderunner.co" is named "Martin Stabenfeldt"

  Scenario: Navigate from the front page, create and delegate the request
    Given I am on the home page
    When I follow "Get help"
    And I fill in and submit the request form
    And I press "Send emails" within the invitation pop up box
