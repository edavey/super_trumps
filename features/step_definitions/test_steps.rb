Given(/^I have "(.*?)" with "(.*?)" (\d+)$/) do |character, attribute, value|
  card = Factory.create(:card, :character => character, attribute.to_sym => value.to_i)
  @me.stub(:current_card).and_return(card)
end

Given(/^the machine has "(.*?)" with "(.*?)" (\d+)$/) do |character, attribute, value|
  card = Factory.create(:card, :character => character, attribute.to_sym => value.to_i)
  @player_2.stub(:current_card).and_return(card)
end

When(/^I choose to play with "(.*?)"$/) do |attribute|
  binding.pry
end

Then(/^I should see that I won with "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the captured card for "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end