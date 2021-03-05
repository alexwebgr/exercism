#!/usr/bin/env ruby
require_relative './scrabble_score'

hawaiian = {
  "A" => 1,
  "N" => 3,
  "O" => 2,
  "P" => 8,
  "E" => 4,
  "H" => 6,
  "U" => 5,
  "I" => 3,
  "W" => 9,
  "K" => 2,
  "L" => 7,
  "M" => 8,
  "‘" => 0 # I don't know the score for this letter. I think it might be 0
}

puts Scrabble.new('hello').score # 8
puts Scrabble.new('aloha', tile_set = hawaiian).score # 17
puts Scrabble.new('aloha', hawaiian).score # 17
puts Scrabble.new('he‘e', hawaiian).score # => 14
puts Scrabble.new('Humuhumunukunukuapuaa', hawaiian).score # 94
