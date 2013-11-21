Super Trumps
============

Super hero top-trumps.

Description of the gameplay in term of our code entities
--------------------------------------------------------

A `game` has:

  - 2 `Players`. Player 1 is the human being and Player 2 is the computer ('The Machine').

  - one deck of `Cards`

  - many `Turns`.

Each `Card` has:

  - a `#character` such as 'Catwoman' or 'Wonder Woman'

  - a number of `attributes` such as `agility` or  `fighting_skills` each of which has a numeric value

Each `Player` has:

  - a 'hand', the cards in her current possession

  - a `#current_card`, being the one which is currently in play, i.e. it is top of the stack, face up.

A `Turn` is when:

  - the winner of the previous turn is the current 'challenger'

  - this challenger reviews the attributes of her `current_card` and `#battles_with(attribute)` the chosen attribute. e.g. my current card is Wonder Woman and I decide to battle with her agility value of 72.

  - the player with the highest value in the attribute under challenge is the winner and wins his opponent's card. e.g. Catwoman's agility turns out to be 83, so in this case 'The Machine' is the winner and I have to give up my Wonder Woman card.

Overview of code execution
--------------------------

The `game` is the 'main' element of this program. Its lifecycle is:

  1. created with name of the human known as 'player_1'
  2. imports cards
  3. shuffles pack
  4. deals cards
  5. goes into a loop of Turns until a winner emerges
  6. shows the leader board of known players with their total scores (a win is worth 5 points)
