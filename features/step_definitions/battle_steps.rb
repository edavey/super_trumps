Given(/^I choose to battle with "(.*?)"$/) do |attribute|
  @me.battles_with(attribute.to_sym)
end

Then(/^I should win$/) do
  @game.turns.last.winner.should eql(@me)
end