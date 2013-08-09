Feature: Review an expert
  In order to know which experts that are any good
  As someone how has bought help from an expert
  I want to give that expert an review

  Background:
    Given I have a user "m@kaffesmak.no" with password "not_gonna_get_it"
    And user "m@kaffesmak.no" is named "Martin Stabenfeldt"
    And I am signed in as "m@kaffesmak.no" with password "not_gonna_get_it"

  Scenario: A user which does not have an account at Companybook receives an invite
    Given I am on the home page
    When I follow "Invite"
    And I fill in "Emails" with "vb@skalar.no" within the invitation pop up box
    And I press "Send emails" within the invitation pop up box
