class Luhn
  THRESHOLD = 9

  def self.valid?(candidate)
    new(candidate).valid?
  end

  private

  attr_reader :candidate

  def initialize(candidate)
    @candidate = candidate
  end

  def add_em_up
    digits = candidate.scan(/[\d+]/)
    digits.reverse.map.with_index { |digit, index| index.odd? ? doubler(digit.to_i) : digit.to_i }.sum
  end

  def doubler(digit)
    product = digit * 2
    product -= THRESHOLD if above_threshold?(product)

    product
  end

  def above_threshold?(product)
    product > THRESHOLD
  end

  public

  def valid?
    return false if candidate.delete(' ').length <= 1
    return false if candidate.match(/[^0-9 ]/)

    (add_em_up % 10).zero?
  end
end
