Feature: Manage Requests
  In order to get help
  As signed in user
  I want to post my request for help

Scenario: Post new request
  Given I am signed in as 'm@coderunner.no'
  Given We have an expert named Martin
  When I go to the list of articles
  Then I should see "Pizza"
  And I should see "Breadsticks"
