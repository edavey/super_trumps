module PlayerSH

  def stubs_player_1_current_card_with(card)
    @me.instance_variable_set(:@current_card, card)
  end

  def stubs_player_2_current_card_with(card)
    @player_2.instance_variable_set(:@current_card, card)
  end

end

World PlayerSH

Then(/^I should be able to view my hand$/) do
  displayed_cards = @me.view_hand
  displayed_cards.size.should eql(@me.cards.size)

  displayed_cards.each do |card|
    @me.cards.map(&:character).should       include(card.character)
    @me.cards.map(&:agility).should         include(card.agility)
    @me.cards.map(&:speed).should           include(card.speed)
    @me.cards.map(&:strength).should        include(card.strength)
    @me.cards.map(&:intelligence).should    include(card.intelligence)
    @me.cards.map(&:height).should          include(card.height)
    @me.cards.map(&:fighting_skills).should include(card.fighting_skills)
    @me.cards.map(&:description).should     include(card.description)
    @me.cards.map(&:hero).should            include(card.hero)
  end
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