Feature: Get code help
  In order to get help
  As a signed in user
  I want to post my request for help

  Background:
    Given I am signed in as "i_need_help@example.com"
    And We have the expert group named Ruby on Rails
    And We have one expert user in our database, named Paul

  Scenario: Post new request
    When I go to the frontpage
    Then I press Get someone to help you    
    When I press Code help
    Then I fill in "Title" with "Need help with searching all Facebook posts for Sony"
    And  I fill in "Goal" with "I want an array of IDs to the matching posts returned"
    And  I fill in "Description" with "The syntax of the array should be [POST_ID, POST_ID]
    And  I select "Ruby" as the group
    When I press "Next"
    Then I should see "Who shall we send the question to"
    And I should see at least one expert
    When I press "Send the question to Paul"
    Then I should see "Paul will contact you shortly"
    And the user named Paul should have been delegated the request
