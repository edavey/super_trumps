require "#{File.join(File.dirname(__FILE__), '../', '../', 'lib', 'trumps')}"
require 'cucumber/rspec/doubles'
require 'rspec/mocks/standalone'

Before do
  @game     = Game.new(player_1_name: 'Jos')
  @player_1 = @game.player_1
  @player_2 = @game.player_2
  @me       = @player_1
end



