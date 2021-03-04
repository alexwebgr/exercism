class Scrabble
  TILE_SET = {
    "A" => 1, "N" => 1,
    "B" => 3, "O" => 1,
    "C" => 3, "P" => 3,
    "D" => 2, "Q" => 10,
    "E" => 1, "R" => 1,
    "F" => 4, "S" => 1,
    "G" => 2, "T" => 1,
    "H" => 4, "U" => 1,
    "I" => 1, "V" => 4,
    "J" => 8, "W" => 4,
    "K" => 5, "X" => 8,
    "L" => 1, "Y" => 4,
    "M" => 3, "Z" => 10
  }

  def self.score(word)
    new(word).score
  end

  private

  attr_reader :word
  attr_reader :tile_set

  def initialize(word, tile_set = TILE_SET)
    @word = word.to_s.gsub(/[^a-zA-Z]/, '').upcase
    @tile_set = tile_set
  end

  public

  def score
    return 0 if word.empty?

    word.chars.tally.sum do |letter|
      tile_set[letter[0]] * letter[1]
    end
  end
end