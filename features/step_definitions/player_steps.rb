module PlayerSH

  def stubs_player_1_current_card_with(card)
    @me.stub(:current_card).and_return(card)
  end

  def stubs_player_2_current_card_with(card)
    @player_2.stub(:current_card).and_return(card)
  end

end

World PlayerSH

Then(/^I should be able to view my current card$/) do
  displayed_card = @me.view_current_card
  displayed_card.should  match(/#{@me.current_card.character}/)
  displayed_card.should  match(/#{@me.current_card.agility}/)
  displayed_card.should  match(/#{@me.current_card.speed}/)
  displayed_card.should  match(/#{@me.current_card.strength}/)
  displayed_card.should  match(/#{@me.current_card.intelligence}/)
  displayed_card.should  match(/#{@me.current_card.height}/)
  displayed_card.should  match(/#{@me.current_card.fighting_skills}/)
  displayed_card.should  match(/#{@me.current_card.description}/)
  displayed_card.should  match(/#{@me.current_card.hero}/)
end

Given(/^my current card is "(.*?)"$/) do |character|
  card = @game.find_card(character)
  stubs_player_1_current_card_with(card)
end

Given(/^the current card of player 2 is "(.*?)"$/) do |character|
  card = @game.find_card(character)
  stubs_player_2_current_card_with(card)
end

Then(/^I should now have (\d+) cards in my hand$/) do |quantity|
  pending
  # @me.cards.size.should eql(quantity.to_i)
end