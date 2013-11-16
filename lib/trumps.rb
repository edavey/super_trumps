# require "#{File.dirname(__FILE__)}/helpers"
# require 'pry'
require 'pry'
require 'pry-debugger'
require 'trumps/util'
require 'trumps/game'
require 'trumps/player'
require 'trumps/card'
require 'trumps/battle'



# puts "Top-trumps"

# cards = [
#   { character: "Catwoman",
#     powers:
#             {   height:        170,
#                 intelligence:    5,
#                 strength:       17,
#                 speed:           7,
#                 agility:         18,
#                 fighting_skills: 72,
#                 hero:            false
#               }
#   },

#   { character: "Wonder Woman",
#     powers:
#               { height:        183,
#                 intelligence:     7,
#                 strength:        41,
#                 speed:           18,
#                 agility:         19,
#                 fighting_skills: 78,
#                 hero:            true
#               }
#   }
# ]

# game = Game.new

# cards.each do |card|
#   game.cards << Card.new(card[:character], card[:powers])
# end

# catwoman     = game.cards.first
# wonder_woman = game.cards.last

# binding.pry

# wonder_woman.battles(catwoman, :with => :fighting_skills)

# # Battle.new(wonder_woman, catwoman, :with => :fighting_skills)