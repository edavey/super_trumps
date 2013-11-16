Given(/^the following cards are dealt:$/) do |cards|
  cards.hashes.each do |card|
    player   = card.delete('player')
    new_card = Factory.create(:card, Util::symbolise_keys(card))
    @game.deck << new_card

    if player == '1'
      @player_1.cards << new_card
    else
      @player_2.cards << new_card
    end
    @game.start
  end
end

Given(/^the cards have been dealt$/) do
  @game.deal_cards
end