class Luhn
  THRESHOLD = 9

  def self.valid?(num)
    return false if num.gsub(/\s+/, '').length <= 1
    return false if num.match(/[^0-9 ]/)

    (add_em_up(num) % 10).zero?
  end

  private

  def self.add_em_up(num)
    sum = 0
    numbers = num.scan(/[\d+]/)
    numbers.reverse.each_with_index do |number, index|
      sum += threshold_check(number.to_i) if index % 2
    end

    sum
  end

  def self.threshold_check(number)
    sum = number * 2
    sum -= THRESHOLD if sum > THRESHOLD

    sum
  end
end
