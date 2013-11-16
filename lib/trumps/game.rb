class Game

  attr_accessor :deck, :players, :turns
  attr_reader :player_1, :player_2

  def initialize
    @deck     = []
    @turns    = []
    @players  = [Player.new, Player.new]
  end

  def find_card(character)
    @deck.find{|card| card.character == character}
  end

  def deal_cards
    start
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

  def start
    players.each {|player| player.game = self}
  end
end