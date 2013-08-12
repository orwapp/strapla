Feature: Get code help
  In order to get help
  As a signed in user
  I want to post my request for help

  Background:
    Given I am signed in as "m@coderunner.no"
    And   We have a user "expert@domain.com"
    And   The user "expert@domain.com" is an expert.

  Scenario: Post new request
    When I go to the frontpage
    And I press "Get someone to help you"
    Then I press "Code help"
    Then I should see "New request"
    And I fill in "Subject" with "Need help with searching all Facebook posts for Sony"
    And I fill in "Goal" with "I want an array of IDs to the matching posts returned"
    And I fill in "Description" with "The syntax of the array should be [POST_ID, POST_ID]
    And I select "Ruby" from "request_request_group_id"
    When I press "Next"
    Then I should see "Who shall we send the question to"

