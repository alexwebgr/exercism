=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end

class Pangram
  ALPHABET = ('a'..'z').to_a

  private

  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def self.pangram?(sentence)
    new(sentence).pangram?
  end

  public

  def pangram?
    return false if sentence.empty?

    sentence.downcase.scan(/[a-z]/).tally.size == ALPHABET.size
  end
end