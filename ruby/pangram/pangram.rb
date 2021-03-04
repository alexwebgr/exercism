=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end

class Pangram
  ALPHABET = ('a'..'z').to_a

  def self.pangram?(sentence)
    return false if sentence.empty?

    sentence.downcase.gsub(/[^a-z]/, '').chars.tally.size == ALPHABET.size
  end
end