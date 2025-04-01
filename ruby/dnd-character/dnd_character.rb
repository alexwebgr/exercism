class DndCharacter

  HIT_POINT = 10
  ABILITIES = %w[strength dexterity constitution intelligence wisdom charisma]

  def self.modifier(constitution)
    (Integer(constitution - HIT_POINT) / 2).floor
  end

  private

  def initialize
    ABILITIES.each { |ability| instance_variable_set("@#{ability}", ability_score) }
  end

  def ability_score
    4.times.map { dice_roll }.sort.max(3).sum
  end

  def dice_roll
    rand(1..6)
  end

  public

  attr_reader *ABILITIES

  def hitpoints
    HIT_POINT + self.class.modifier(constitution)
  end

end
