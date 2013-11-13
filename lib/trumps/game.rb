class Game

  attr_accessor :deck, :players
  attr_reader :player_1, :player_2

  def initialize
    @deck = []
    @players = [Player.new, Player.new]
  end

  def deal_cards
    shuffle_deck!
    first, second  = @deck.partition {|card| deck.index(card).even? }
    player_1.cards = first
    player_2.cards = second
  end

  def player_1
    @players[0]
  end

  def player_2
    @players[1]
  end

  def shuffle_deck!
    @deck.shuffle!
  end
end