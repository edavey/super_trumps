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
    HL.say("<%= color('#{self.title}', :headline) %>")
    HL.say "\n"
    players.each {|player| player.game = self}
  end

  def we_have_a_winner?
    player_1.cards.none? || player_2.cards.none?
  end

  def play_till_winner_emerges
    loop do
      turns << Turn.new(self).tap do |turn|
                 turn.go
               end
      break if we_have_a_winner?
    end
    announce_winner
  end

  private

  def announce_winner
    if player_1.cards.any?
      HL.say("<%= color(%{You've won! You have all the cards.}, :headline) %>")
    else
      HL.say("<%= color(%{Hard luck: you've lost! You have no more cards...}, :headline) %>")
    end
  end
end