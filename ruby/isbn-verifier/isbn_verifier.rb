class IsbnVerifier
  def self.valid?(code)
    new(code).valid?
  end

  private

  ISBN_LENGTH = 10
  MODULO = ISBN_LENGTH + 1
  CONTROL_CHARACTER = 'X'

  attr_reader :code

  def initialize(code)
    @code = code.gsub(/[-\s]/, '')
  end

  # Check if the ISBN is exactly 10 characters long
  def length_valid?
    code.length == ISBN_LENGTH
  end

  # Check if the first 9 characters are digits and the last one is a digit or 'X'
  def characters_valid?
    code.match?(/^\d{9}[\d#{CONTROL_CHARACTER}]$/)
  end

  def control_character?(index, character)
    index == ISBN_LENGTH - 1 && character == CONTROL_CHARACTER
  end

  # Calculate the sum
  def sum
    code.chars.each_with_index.reduce(0) do |sum, (character, index)|
      value = control_character?(index, character) ? ISBN_LENGTH : character.to_i
      sum + value * (ISBN_LENGTH - index)
    end
  end

  # Check if the sum is divisible by 11
  def valid_sum?
    sum % MODULO == 0
  end

  public

  def valid?
    return false unless length_valid?
    return false unless characters_valid?

    valid_sum?
  end
end
