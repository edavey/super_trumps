class Card

  attr_reader :agility, :speed, :strength, :intelligence, :height, :fighting_skills,
                :character, :description, :hero

  def initialize(attrs)
    @character       = attrs.fetch(:character)
    @agility         = attrs.fetch(:agility)
    @speed           = attrs.fetch(:speed)
    @strength        = attrs.fetch(:strength)
    @intelligence    = attrs.fetch(:intelligence)
    @height          = attrs.fetch(:height)
    @fighting_skills = attrs.fetch(:fighting_skills)
    @description     = attrs.fetch(:description)
    @hero            = attrs.fetch(:hero)
  end

  def display_attributes
    attributes.reject{|a| a == :character}.
      inject({}) do |hash, attribute|
        hash[attribute] = self.send(attribute)
        hash
      end
  end

  def display
    label      = hero ? 'a hero' : 'an evil villain'
    header     = "<%= color(%{#{character} (#{label})}, :headline) %>"
    attributes = display_attributes.map{|k, v| "#{k.to_s.ljust(15)}: #{v}"}
    ::HL.list([header] + attributes)
  end

  private

  def attributes
    self.instance_variables.map do |iv|
      iv.to_s.sub('@', '').to_sym
    end
  end

end