=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end

class Phrase
  WORD_REGEX = /\b[\w']+\b/

  def initialize(words)
    @words = words
  end

  def word_count
    @words.downcase.scan(WORD_REGEX).tally
  end
end
