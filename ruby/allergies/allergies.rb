class Allergies
  ALLERGIES = {
    'eggs' => 1,
    'peanuts' => 2,
    'shellfish' => 4,
    'strawberries' => 8,
    'tomatoes' => 16,
    'chocolate' => 32,
    'pollen' => 64,
    'cats' => 128
  }.freeze

  private
  attr_reader :num

  def initialize(num)
    @num = num
  end

  public
  def list
    ALLERGIES.keys.select { |allergen| allergic_to?(allergen) }
  end

  def allergic_to?(item)
    (num & ALLERGIES[item]) > 0
  end
end