=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  HIT_POINT = 10
  ABILITIES = %w[strength dexterity constitution intelligence wisdom charisma]
  attr_reader *ABILITIES

  def self.modifier(constitution)
    ((constitution - 10) / 2).floor
  end

  def initialize
    ABILITIES.each { |attr| instance_variable_set("@#{attr}", generate_ability_score) }
  end

  def hitpoints
    HIT_POINT + self.class.modifier(@constitution)
  end

  def generate_ability_score
    4.times.map { dice_roll }.sort[1..3].sum
  end

  def dice_roll
    rand(1..6)
  end
end
