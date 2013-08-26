Feature: Price Quotes
  In order to get requests answerd, it must be possible to respond to them with a price quote.
  As an expert that has logged in
  I want to see new requests and reply with a price quote.

  Background:
    Given I am signed in as "expert@coderunner.co"
    And "expert@coderunner.co" is an expert
    And "expert@coderunner.co" has the name "Martin Stabenfeldt"
    And We have the expert group named "Ruby on Rails"

  Scenario: Respond to a requst sent to a group
    Given "need_help@cr.no" has posted a request titled "Need help with Facebook" in the "Ruby on Rails" group
    When I go to the frontpage
    Then I click "Unassiged request (1)"
    And I click "Need help with Facebook"


  Scenario: Respond to a requst sent to one expert
    Given "need_help@cr.no" has posted a request titled "Need help with Facebook" delegated to "expert@coderunner.co"
    And I am signed in as "need_help@cr.no"
    When I visit the frontpage
    And I click New requests sent to you
    Then I click "Need help with searching all Facebook posts for Sony" 
    And I fill "Comment" with "I've done this many times"
    And I fill "Price" with "120"
    And I fill "Hours Estimated" with "2"
    When I press Send
    Then "need_help@cr.no" should receive an email with the text "Martin Stabenfeldt has sent you a price quote"
    And "need_help@cr.no" clicks the link "Resond to price quote"
    Then 

