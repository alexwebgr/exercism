class ParsingError < StandardError; end

class IsbnVerifier
  ISBN_LENGTH = 10
  MODULO = ISBN_LENGTH + 1

  def self.valid?(code)
    new(code).valid?
  end

  private

  attr_reader :code

  def initialize(code)
    @code = code
  end

  def digits_sum
    return false unless digits
    digits_sum = digits.map.with_index.sum { |digit, index| digit.to_i * (ISBN_LENGTH - index) }
    control = control_digit(digits_sum)
    return false unless control
    digits_sum + control
  end

  def digits
    code_digits = code.scan(/[0-9]/)
    return false if code_digits.empty? || code.delete('-').length != ISBN_LENGTH
    # we assume that after selecting just numbers there should be 9 characters.
    return false if code_digits.size < ISBN_LENGTH - 1

    code_digits
  end

  def control_digit(digits_sum)
    return 0 unless code[-1].downcase == 'x'
    remainder = (digits_sum % MODULO)
    return false if remainder.zero?

    MODULO - remainder
  end

  public

  def valid?
    return false unless digits_sum
    (digits_sum % MODULO).zero?
  end
end