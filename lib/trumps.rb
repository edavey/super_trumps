require 'pry'
require 'pry-debugger'
$LOAD_PATH.push File.expand_path("../", __FILE__)
require 'highline/import'
HL = HighLine.new
require 'trumps/util'
require 'trumps/game'
require 'trumps/turn'
require 'trumps/player'
require 'trumps/card'
require 'trumps/battle'


ft = HighLine::ColorScheme.new do |cs|
        cs[:headline]        = [ :bold, :yellow, :on_black ]
        cs[:horizontal_line] = [ :bold, :white, :on_blue]
        cs[:question]        = [ :bold, :green, :on_blue]
     end

# Assign that color scheme to HighLine...
HighLine.color_scheme = ft

