Feature: Manage Requests
  In order to get help
  As signed in user
  I want to post my request for help

Scenario: Post new request
  Given 
  Given I have articles titled Pizza, Breadsticks
  When I go to the list of articles
  Then I should see "Pizza"
  And I should see "Breadsticks"
