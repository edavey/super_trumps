class Player
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def view_hand
    @cards.each {|card| card.display}
  end

end