class Turn

  attr_reader   :game
  attr_accessor :challenging_attribute
  attr_accessor :battle

  extend Forwardable
  def_delegator :game, :player_1, :player_1
  def_delegator :game, :player_2, :player_2

  def initialize(game)
    @game       = game
  end

  def challenger
    return player_1 if game.turns.none?
    return player_1 if game.turns.last.battle.winner == player_1
    player_2
  end

  # def defender
  #   if challenger == player_1
  #     player_2
  #   else
  #     player_1
  #   end
  # end

  def go
    introduce_turn
    show_player_1_his_card
    solicit_or_deliver_challenge
    perform_battle
    give_winner_the_spoils
    show_result
    ask_to_proceed
  end

  private

  def ask_to_proceed
    prompt = "Press the spacebar when you are ready for the next go..."
    HL.ask("<%= color('#{prompt}', :question) %>") do |q|
      q.echo      = false
      q.character = true
      # q.validate  = /\A[#{choices}]\Z/
    end
  end

  def introduce_turn
    HL.say "\n"
    HL.say "This is turn number: #{game.turns.size + 1}"
    HL.say "You have #{player_1.cards.size} cards"
    HL.say "\n"
  end

  def show_result
    HL.say "\n"
    if player_1_won?
      HL.say "You Won!"
      HL.say "Your attribute '#{battle.attribute}' was higher than your opponent's of #{battle.losing_card.send(battle.attribute)}."
      HL.say "You have won the following card:"
      HL.say "\n"
      HL.say battle.losing_card.display
    else
      HL.say "You Lost..."
      HL.say "Your attribute '#{battle.attribute}' was lower than your opponent's card '#{battle.winning_card.character}' with #{battle.attribute} #{battle.winning_card.send(battle.attribute)}."
      HL.say "You have to give '#{battle.losing_card.character}' to your opponent."
    end
    HL.say "\n"
  end

  def player_1_won?
    battle.winner == player_1
  end

  def show_player_1_his_card
    HL.say "Your current card is:"
    HL.say "\n"
    HL.say player_1.view_current_card
  end

  def solicit_or_deliver_challenge
    if player_1 == challenger
      HL.say "\n"
      self.challenging_attribute =
        HL.ask("<%= color('Which attribute do you want to use in this battle?', :question) %>")
    else
      HL.say "\n"
      HL.say "The machine will now challenge you."
      HL.say "\n"
      self.challenging_attribute =
        [:agility, :speed, :strength, :intelligence, :height, :fighting_skills][rand(6)]
      challenge = "The machine challenges you with '#{self.challenging_attribute}' of #{challenger.current_card.send(challenging_attribute)}. How do you like that?"
      HL.say("<%= color(%{#{challenge}}, :headline) %>")
      HL.say("\n")
      prompt = "Press the space bar to perform the battle..."
      HL.ask("<%= color('#{prompt}', :question) %>") do |q|
        q.echo      = false
        q.character = true
      end
    end
  end

  def perform_battle
    @battle = challenger.battles_with(challenging_attribute.downcase.to_sym)
  end

  def give_winner_the_spoils
    battle.loser.gives_current_card_to(battle.winner)
    battle.winner.puts_current_card_to_back_of_hand
  end

end