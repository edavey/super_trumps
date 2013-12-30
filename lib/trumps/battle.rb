class Battle
  attr_reader :challenger, :attribute, :winner, :game, :winning_card, :losing_card

  def initialize(attrs)
    @game         = attrs[:game]
    @challenger   = attrs[:challenger]

    @attribute    = attrs[:attribute]
    @winner       = slug_it_out
  end

  def slug_it_out
    if challenger.current_card.send(attribute) > other_player.current_card.send(attribute)
      @winning_card = challenger.current_card
      @losing_card  = other_player.current_card
      challenger
    else
      @winning_card = other_player.current_card
      @losing_card  = challenger.current_card
      other_player
    end
  end

  def loser
    if game.player_1 == winner
      game.player_2
    else
      game.player_1
    end
  end

  private

  def other_player
    if challenger == game.player_1
      game.player_2
    else
      game.player_1
    end
  end
end