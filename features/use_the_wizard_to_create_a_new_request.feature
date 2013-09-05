@javascript
Feature: Use the wizard to create a new request
  In order to answer all the tough questions that are needed to start a successful project
  As a registered user
  I want guidance from the wizard

  Background:
    Given I am signed in
    And We have the expert group named Ruby on Rails
    And We have one expert user in our database
    And this data to fill the background information form:
      | Elevator pitch         | Get help from anyone |
      | Background information | Inspiration from OSW |
      | Title                  | Build something nice |
      | Description            | ljlkjljl             |

  Scenario: Complete the first page of the wizard, the background information
    When I go to the frontpage
    Then I press "Get someone to help you"
    When I press "Build something new"
    Then I fill in all the mandatory fields with the necessary background information.
    And I select "Ruby on Rails" as the technology I want the this application build in.
    When I press "Next"
    Then we should have one Request object saved

  Scenario: Create two features
    Given I have completed the first part of the wizard
    Then I should see "Describe which features you want"
    Then I fill in the first New feature form
    And I fill in the second New feature form
    When I press "Next"
    Then I should have 2 features stored in the database

  Scenario: Review the feature before submitting
    Given I have created two features
    Then I should see "Please review before submitting"
    When I press "Submit"
    Then we should have a new request available for consultants to give a price quote on.
    # Provide a select menu for the keywords /Given|And|Then|Or|etc../
