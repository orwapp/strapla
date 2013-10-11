@javascript
Feature: Respond to a request - Send a Price Quote
  The experts that wants to earn money should be able to respond to requests
  Even as visitors, they should be able to see which assignments they can earn money by solving

  Background:
    Given "noob@noob.no" has posted a request titled "Need help to build an iOS app" in the "iOS" group

  Scenario: See which unassigned requests we got and respond to one of them
    When I go to the frontpage
    Then I click "Unassigned requests 1"
    And  I click "Need help to build an iOS app"

    When  I press "Quote a price"
    Then I should see "You need to sign in or sign up before continuing"
    And I sign up as "expert@coder.com"

    Then I fill in "Comment" with "I can do this next week"
    And  I fill in "Total price in USD" with "120"
    And  I fill in "Hours estimated" with "30"
    When I press "Send"
    Then "noob@noob.no" should be notified that I have sent a price quote

  Scenario: The owner of the request receives an email telling him that someone wants to do his assignment
    Given "expert@coder.com" has sent a price quote to the request owner "noob@noob.no" 
    Then "noob@noob.no" should receive an email
    And "noob@noob.no" opens the email with subject "New price quote on Stabstr"

    Given I am signed in as "noob@noob.no"
    And I follow "Open price quote at Stabstr" in the email
    #Then I should be on the page where I can negotiate terms with the developer
    And I fill in "Comment" with "martin"
    And I press "Create Comment"
    And "expert@coder.com" should receive an email with the following body:
      |martin|
    When "expert@coder.com" follow "Open price quote at Stabstr" in the email
    And he fill in "Total price in USD" with "100"
    And he press "Update"

    Then "noob@noob.no" should receive an email
    Given he is signed in as "noob@noob.no"
    When "noob@noob.no" opens the email with subject "Updated price quote at Stabstr"
    And "noob@noob.no" follow "Updated price quote at Stabstr" in the email
    When I press "Accept"
    Then "expert@coder.com" should receive an email
    And "expert@coder.com" opens the email with subject "Your price quote was accepted"
    And "expert@coder.com" should receive an email with the following body:
      |  has accepted your price quote! |
    And the request titled "Need help to build an iOS app" should be marked as delegated to "expert@coder.com"

  Scenario: Requests that are delegated to an expert is not visible any more
    Given the request titled "Need help to build an iOS app" have been marked as delegated to "expert@coder.com"
    When I visit "Unassigned requests"
    Then I should not see ""Need help to build an iOS app"
