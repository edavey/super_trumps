module Factory

  def self.create(thing, attrs)
    case thing
      when :card
      then
        Card.new(card_attrs.merge(attrs))
    end
  end

  private

  def self.card_attrs
    {
      character:        'Superman',
      agility:          49,
      speed:            13,
      strength:         43,
      intelligence:     57,
      height:           176,
      fighting_skills:  28,
      description:      "The quintessential superhero. But can't tolerate krytonite.",
      hero:             true
    }
  end

end