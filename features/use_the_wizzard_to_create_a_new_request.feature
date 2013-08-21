Feature: Use the wizzard to create a new request
  In order to answer all the though questions that are needed to start a successful project
  As a registered user
  I want guidance from the wizzard

  Background:
    Given I am signed in as "m@coderunner.co"
    And   We have the expert "expert@domain.com"

  Scenario: Post a new request using the wizzard
    When I go to the frontpage
    Then I press "Get someone to help you"
    And I press "Build something new"
    Then I should see "New request"
    And I fill in "Subject" with "I want to build CodeRunner"
    And I fill in "Goal" with "Get the wizzard working within a week"
    And I fill in "Description" with "Do as discussed with Joachim"
    And I select "Ruby" from "request_request_group_id"
    When I press "Next"

    Then I should see "Describe the products' functionallity"
    And  I should see "To make sure the developer understands what you want to build, please answer the following questions"

    And I fill in feature_name with 'The Wizzard'
