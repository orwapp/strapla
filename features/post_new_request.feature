Feature: Get code help
  In order to get help
  As a signed in user
  I want to post my request for help

  Background:
    Given I am signed in as "i_need_help@example.com"
    And we have the expert group named Ruby on Rails
    And we have one expert user in our database, named Paul

	@javascript
  Scenario: Post new request
    When I go to the frontpage
    Then I press "Start your project"
    And  I press "Build something new"
    Then I fill in "Title" with "Need help with searching all Facebook posts for Sony"
    And  I fill in "Description" with "The syntax of the array should be [POST_ID, POST_ID]"
    And  I fill in "System description" with "I want an array of IDs to the matching posts returned"
    And  I press "Save"
    And  I select "Integration"
    And  I press "Continue"
    And  I press "No, let the developer pick what he thinks is best"
    And  I press "skip"

		Then I should see "Describe which features you want"
    And  I fill in "Title" with "login"
    And  I fill in "Text" with "login with face and twitter"
    And  I press "Add"
    And  I press "Next"

		# Review page
		And  I press "Next"

    Then I should see "Who shall we send the question to"
    And  I should see at least one expert
    When I press "Send the question to Paul"

    Then I should see "Paul will contact you shortly"
    And the user named Paul should have been delegated the request

