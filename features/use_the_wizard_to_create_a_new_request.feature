@javascript
Feature: Use the wizard to create a new request
  In order to answer all the tough questions that are needed to start a successful project
  As a registered user
  I want guidance from the wizard

  Background:
    Given I am signed in
    And we have the expert group named Ruby on Rails
    And we have one expert user in our database
    And this data to fill the background information form:
      | Elevator pitch         | Get help from anyone |
      | Background information | Inspiration from OSW |
      | Title                  | Build something nice |
      | Description            | ljlkjljl             |

  Scenario: Complete the first page of the wizard, the background information
    When I go to the frontpage
    Then I press "Start your project"
		Then I fill in "Title" with "lkjlkj"
		Then I fill in "Goal" with "lkjlkj"
		Then I fill in "Description" with "lkjlkj"
    When I press "Next"
		# Background information 
    When I press "Continue"
    When I press "Continue"
    When I press "Continue"
    And I select "Ruby on Rails" as the technology I want the this application build in.
    When I press "Continue"
    Then we should have one Request object saved

	@javascript
  Scenario: Create two features
    Given I have completed the first part of the wizard
    Then I should see "Describe which features you want"
		And I fill in "Title" with "Facebook likes"
    When I press "Add"
    When I press "Save"
		And  I fill in "Title" with "Twitter signin"
    When I press "Save"
    When I press "Next"
    Then I should have 2 features stored in the database

  Scenario: Review the feature before submitting
    Given I have created two features
    Then I should see "Please review your request"
    When I press "Next"
    Then we should have a new request available for consultants to give a price quote on.
    # Provide a select menu for the keywords /Given|And|Then|Or|etc../
