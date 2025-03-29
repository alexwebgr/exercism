=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  HIT_POINT = 10
  ABILITIES = %w[strength dexterity constitution intelligence wisdom charisma]

  def self.modifier
    new.modifier
  end

  def modifier
    scores = generate_ability_score
    HIT_POINT + constitution_modifier(scores["constitution"])
  end

  def generate_ability_score
    ABILITIES.each_with_object({}) do |ability, memo|
      memo[ability] = (1..4).map { dice_roll }.sort[1..3].sum
    end
  end

  def dice_roll
    rand(1..6)
  end

  def constitution_modifier(constitution)
    ((constitution - 10) / 2).floor
  end
end
