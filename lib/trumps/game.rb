class Game

  attr_accessor :deck, :players, :turns
  attr_reader :player_1, :player_2

  def initialize(attrs)
    @deck     = []
    @turns    = []
    @players  = [Player.new(attrs[:player_1_name]), Player.new('The Machine')]
  end

  def title
    "#{player_1.name} vs. #{player_2.name}"
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

  def load_cards
    cards = Dir.glob(File.join(File.dirname(__FILE__), '../../', 'assets', 'cards', '*.yml'))
    cards.each do |card|
      deck << Card.new(YAML.load_file(card))
    end
  end

  def start
    players.each {|player| player.game = self}
  end

  def play_till_winner_emerges
    20.times do
      turns << Turn.new(self)
    end
  end
end