class RotationalCipher
  attr_reader :characters
  attr_reader :position
  ALPHABET = ('a'..'z').to_a
  ALPHABET_CAP = ('A'..'Z').to_a

  def self.rotate(characters, position)
    new(characters, position).rotate
  end

  def initialize(characters, position)
    @characters = characters
    @position = position
  end

  def capital?(char)
    char == char.upcase
  end

  def calc_position(char)
    charset = capital?(char) ? ALPHABET_CAP : ALPHABET
    current_position = charset.index(char)
    return char if current_position.nil?

    target_position = current_position + position
    target_position >= charset.length ? target_position -= charset.length : target_position

    charset[target_position]
  end

  def rotate
    characters.chars.each_with_object([]) { |char, memo| memo << calc_position(char) }.join
  end
end