Feature: Comment on a Price Quote
  In order to get all the details right and to keep the communication within CodeRunner
  As a requst owner or someone who has sent an price quote
  It should be possible to add comment to the price quote.

  Background:
    Given "noob@noob.no" has posted a request titled "Need help to build an iOS app" in the "iOS" group
    And "expert@expert.com" has sent a price quote on that request

  Scenario: The request owner adds a comment to the price quote
    Given I am signed in as "noob@noob.no"
    When I visit the page where I can see the latest request
    And I fill in "Comment" with "nice man"
    And I press "Create Comment"
    Then "expert@expert.com" should receive an email
    And "expert@expert.com" opens the email with subject "New comment on CodeRunner"
    When "expert@expert.com" follow "Read comment" in the email
    Then he should see "nice man"

