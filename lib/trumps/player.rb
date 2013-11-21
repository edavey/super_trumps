class Player
  attr_accessor :cards, :current_card, :game, :name

  def initialize(name)
    @cards = []
    @name  = name
  end

  def view_hand
    @cards.each {|card| card.display}
  end

  def battles_with(attribute)
    game.turns << Battle.new(challenger: self, attribute: attribute, game: game)
  end

end