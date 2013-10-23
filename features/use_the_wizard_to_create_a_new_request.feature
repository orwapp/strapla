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

		# The user can choose from extend existing app, fix bug and..
    And I press "Build something new"

    # Request new
		Then I fill in "Title" with "Calculator"
		And  I fill in "Description" with "Complex calculations"
		And  I fill in "Background information" with "People need help to calculate"
    And  I press "Next"

    # Then I should see a list of things that can be built
    # :select_what_kind_of_software,
		And I press "Web Application"

    #Then I should see a list of programming languages and framework
    # :preferred_technology
    Then I should see "Do you have any preferences regarding programming language or framework?"
		And  I press "Yes, let me decide"
		And  I press "Ruby on Rails"

    Then I should see "What is the frame?"
		And  I fill in "Due date" with "01.01.2014"
    And  I press "Next"

    Then I should see "Create a test"
    And  I press "Skip"

    Then I should see "Review"
    And  I press "Next"

		# Select recipient
    Then I should see "Who shall we send the request to?"
		And  I press "Send to the 'Ruby' group"
		Then the "Ruby" group should have one new unassigned request


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
