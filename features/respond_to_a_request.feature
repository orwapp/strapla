@javascript
Feature: Respond to a request
  The experts that want to earn money should be able to respond to requests
  Even as visitors, they should be able to see which assignments they can earn money by solving

  Background:
    Given "noob@noob.no" has posted a request titled "Need help to build an iOS app" in the "iOS" group

  Scenario: See which unassined requests we got and respond to one of them
    When I go to the frontpage
    Then I click "Unassigned request 1"
    And  I click "Need help to build an iOS app"

    When  I press "Quote a price"
    Then I should see "You need to sign in or sign up before continuing"
    And I sign up as "expert@coder.com"

    Then I fill in "Comment" with "I can do this next week"
    And  I fill in "Total price in USD" with "120"
    And  I fill in "Hours estimated" with "30"
    When I press "Send"
    Then "noob@noob.no" should be notified that I have sent a price quote



