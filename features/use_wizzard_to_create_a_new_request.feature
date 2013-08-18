Feature: Use the wizzard to create a new request
  In order to answer all the though questions are needed to start a sucsessfull project
  As a registered user
  I want quideance from the wizzard

  Background:
    Given I am signed in as "m@coderunner.co"
    And   We have the expert "expert@domain.com"

  Scenario: Post a new request using the wizzard
    When I go to the frontpage
    And I press "Get someone to help you"
    Then I press "Code help"
    Then I should see "New request"
    And I fill in "Subject" with "Need help with searching all Facebook posts for Sony"


