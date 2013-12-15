Feature: Sign in
  In order to make site usable to anyone
  As a unknown user to the system
  I want to authenticate and get acccess

  Background:
    Given I have a user "m@kaffesmak.no" with password "not_gonna_get_it"

  Scenario: Sign in
    Given I am signed in as "m@kaffesmak.no" with password "not_gonna_get_it"
    Then I should see "Signed in successfully."
    #Then I should be on my profile's page

  Scenario: Not be informed that I am already signed in when visiting the home page
    Given I am signed in as "m@kaffesmak.no" with password "not_gonna_get_it"
    When I go to the home page
    Then I should not see "Signed in successfully."
