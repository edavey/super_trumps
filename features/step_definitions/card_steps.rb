Given(/^the following cards:$/) do |cards|
  cards.hashes.each do |card|
    @game.deck << Factory.create(:card, {character: card['character']})
  end
end

Given(/^the cards have been dealt$/) do
  @game.deal_cards
end

Then(/^I should have (\d+) cards$/) do |quantity|
  @game.player_1.cards.size.should eql(quantity.to_i)
end