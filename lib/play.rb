$LOAD_PATH.push File.expand_path("../", __FILE__)
require 'trumps'

HL.say "\n"
HL.say("<%= color('Super Trumps', :headline) %>")
HL.say("<%= color('-'*12, :horizontal_line) %>")
HL.say "\n"
name = HL.ask "<%= color(%{What's your name?}, :question) %>" do |q|
    q.validate = /[a-zA-Z]{2,}/
end

game = Game.new(player_1_name: name)
game.load_cards
game.deal_cards
game.play_till_winner_emerges