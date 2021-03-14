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
    numbers = candidate.scan(/[\d+]/)
    numbers.reverse.each_with_index do |number, index|
      sum += index.odd? ? doubler(number.to_i) : number.to_i
    end

    sum
  end

  def doubler(number)
    sum = number * 2
    sum -= THRESHOLD if above_threshold?(sum)

    sum
  end

  def above_threshold?(sum)
    sum > THRESHOLD
  end

  public

  def valid?
    return false if candidate.gsub(/\s+/, '').length <= 1
    return false if candidate.match(/[^0-9 ]/)

    (add_em_up % 10).zero?
  end
end
