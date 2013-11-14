require "#{File.join(File.dirname(__FILE__), '../', '../', 'lib', 'trumps')}"

Before do
  @game = Game.new
  @me = @game.player_1
end



