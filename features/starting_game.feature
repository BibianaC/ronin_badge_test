Feature: Starting the game
  In order to play rock paper scissors
  As a nostalgic player
  I want to start a new game

  Scenario: Registering the first player
    Given I am on the homepage
    When I follow "start"
    And I enter my name "Bibiana"
    Then I press "submit"
    Then I should see "Choose an option Bibiana"

  Scenario: Playing a single player game
    Given I am on the game page
    When I follow "rock"
    Then I should see "lose", "win" or "draw"

  Scenario: Being able to try again
    Given I am on the start game page
    When I follow "try_again"
    Then I should be on the game page


