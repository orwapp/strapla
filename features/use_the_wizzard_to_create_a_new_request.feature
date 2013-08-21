Feature: Use the wizard to create a new request
  In order to answer all the tough questions that are needed to start a successful project
  As a registered user
  I want guidance from the wizard

  Background:
    Given I am signed in
    And   We have one expert user in our database

  Scenario: Complete the first page of the wizard, the background information
    When I go to the frontpage
    Then I press "Get someone to help you"
    When I press "Build something new"
    Then I should see "Please provide some background information"
    And I fill in all the mandatory fields with the necessary background information.
    And I select "Ruby on Rails" as the technology I want the this application build in.
    And I press "Next"

  Scenario: Create two features
    Given I have completed the first part of the wizard
    An I am on the page where I can add new features
    Then I should see "Describe which features you want"
    And  I should see "Understand what a User Story is"
    Then I fill in the "New feature form"

