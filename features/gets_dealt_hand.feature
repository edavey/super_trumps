Feature: Hand gets dealt
  As a player I get dealt a hand of cards
  So that I can begin to play

  Background:

    Given the following cards:
      | character    | hero | agility |
      | Wonder Woman | true |    71   |
      | Catwoman     |      |    64   |
      | Batman       | true |    87   |
      | The Joker    |      |    42   |

  Scenario:
    Given the cards have been dealt
    Then I should have 2 cards


