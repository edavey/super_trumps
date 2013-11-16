Given(/^the following cards:$/) do |cards|
  cards.hashes.each do |card|
    @game.deck << Factory.create(:card, Util::symbolise_keys(card))
  end
end

Then(/^I should have (\d+) cards$/) do |quantity|
  @game.player_1.cards.size.should eql(quantity.to_i)
end