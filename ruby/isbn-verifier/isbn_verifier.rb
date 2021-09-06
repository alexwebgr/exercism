class ParsingError < StandardError; end

class IsbnVerifier
  ISBN_LENGTH = 10
  MODULO = ISBN_LENGTH + 1

  attr_reader :code

  def initialize(code)
    @code = code
  end

  def self.valid?(code)
    new(code).valid?
  end

  def valid?
    digits_sum = digits.map.with_index { |digit, index| digit.to_i * (ISBN_LENGTH - index) }.sum
    digits_sum += control_digit(digits_sum)

    (digits_sum % MODULO).zero?

  rescue ParsingError => e
    false
  end

  def digits
    digits = code.scan(/[0-9]/)
    raise ParsingError, 'input length has to be 10 characters' if digits.empty? || code.gsub(/-/, '').length != ISBN_LENGTH
    # we assume that after selecting just numbers there should be 9 characters
    raise ParsingError, 'input contains invalid characters' if digits.size < ISBN_LENGTH - 1

    digits
  end

  def control_digit(digits_sum)
    return 0 unless code[-1].downcase == 'x'
    remainder = (digits_sum % MODULO)
    raise ParsingError, 'control digit cannot be zero' if remainder.zero?

    MODULO - remainder
  end
end