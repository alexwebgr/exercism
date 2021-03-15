class Luhn
  THRESHOLD = 9

  attr_reader :candidate

  def self.valid?(candidate)
    new(candidate).valid?
  end

  private

  def initialize(candidate)
    @candidate = candidate
  end

  def add_em_up
    sum = 0
    digits = candidate.scan(/[\d+]/)
    digits.reverse.each_with_index do |digit, index|
      sum += index.odd? ? doubler(digit.to_i) : digit.to_i
    end

    sum
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
