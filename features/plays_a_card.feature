Feature: I play a card
  As player 1 I choose to play a given attribute from a chosen card

  Background:

    Given the following cards are dealt:
      | character    | hero | agility | player |
      | Wonder Woman | true |    71   |   1    |
      | Catwoman     |      |    64   |   1    |
      | Batman       | true |    87   |   2    |
      | The Joker    |      |    42   |   2    |


  Scenario: I play a winning card / attribute combination
    Given my current card is "Wonder Woman"
    And the current card of player 2 is "The Joker"
    And I choose to battle with "agility"
    Then I should win
    And I should now have 3 cards in my hand


