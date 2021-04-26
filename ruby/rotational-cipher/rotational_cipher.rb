class RotationalCipher
  ALPHABET = ('a'..'z').to_a
  ALPHABET_CAP = ('A'..'Z').to_a

  attr_reader :characters
  attr_reader :position

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

    charset.rotate(target_position).first
  end

  def rotate
    characters.chars.each_with_object([]) { |char, memo| memo << calc_position(char) }.join
  end
end