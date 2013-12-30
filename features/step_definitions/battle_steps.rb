Given(/^I choose to battle with "(.*?)"$/) do |attribute|
  Turn.new(@game).tap do |turn|
    turn.battle = @me.battles_with(attribute.to_sym)
    @game.turns << turn
  end
end

Then(/^I should win$/) do
  @game.turns.last.battle.winner.name.should eql(@me.name)
end