class IsbnVerifier
  START = 10
  ISBN_LENGTH = 10

  attr_reader :code

  def initialize(code)
    @code = code
  end

  def self.valid?(code)
    new(code).valid?
  end

  def valid?
    return false unless code.gsub(/-/, '').length == ISBN_LENGTH

    digits = code.scan(/[0-9]/)
    return false if digits.size < ISBN_LENGTH - 1 || digits.empty?

    dig_sum = digits.map.with_index do |digit, index|
      multiplier = START - index
      digit.to_i * multiplier
    end.sum

    control = code[-1].downcase
    if control == 'x'
      remainder = (dig_sum % 11)
      return false if remainder.zero?

      check_digit = 11 - remainder
      dig_sum += check_digit
    end

    (dig_sum % 11).zero?
  end
end