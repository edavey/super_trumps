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

  def battles(who, how)
    puts "awsome battle! you lose/win!"
  end

end