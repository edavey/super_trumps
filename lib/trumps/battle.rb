class Battle
  attr_reader :challenger, :attribute, :winner, :game

  def initialize(attrs)
    @game        = attrs[:game]
    @challenger  = attrs[:challenger]
    @attribute   = attrs[:attribute]
    @winner      = slug_it_out
  end

  def slug_it_out
    if challenger.current_card.send(attribute) > other_player.current_card.send(attribute)
      challenger
    else
      other_player
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