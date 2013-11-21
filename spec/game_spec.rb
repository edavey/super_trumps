require "spec_helper"

describe Game do

  context 'On initialization' do
    Given(:game) { Game.new(player_1_name: 'Jos') }
    Then         { game.title.should eql('Jos vs. The Machine') }
  end

end
