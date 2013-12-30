class Player
  attr_accessor :cards, :game, :name

  def initialize(name)
    @cards = []
    @name  = name
  end

  def current_card
    @cards.first
  end

  def view_current_card
    current_card.display
  end

  def gives_current_card_to(winner)
    winner.cards << cards.slice!(0)
  end

  def puts_current_card_to_back_of_hand
    self.cards << cards.slice!(0)
  end

  def battles_with(attribute)
    Battle.new(challenger: self, attribute: attribute, game: game)
  end

end