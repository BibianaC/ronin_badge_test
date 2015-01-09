Feature: Starting the game
  In order to play rock paper scissors
  As a nostalgic player
  I want to start a new game

  Scenario: Registering the first player
    Given I am on the homepage
    When I follow "Let's play!"
    Then I should see "What's your name?"
    When I enter my name "Bibiana"
    Then I press "submit"
    Then I should see "Let's start Bibiana!"

  Scenario: Playing a single player game
    Given I am on the game page
    When I follow "rock"
    Then I should see "lose", "win" or "draw"


