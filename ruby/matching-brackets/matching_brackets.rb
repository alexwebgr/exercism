=begin
Write your code for the 'Matching Brackets' exercise in this file. Make the tests in
`matching_brackets_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matching-brackets` directory.
=end

class Brackets
  BRACKETS = { '(' => ')', '[' => ']', '{' => '}' }
  attr_reader :input

  def self.paired?(input)
    new(input).paired?
  end

  def initialize(input)
    @input = input
  end

  def paired?
    stack = []

    input.chars do |char|
      if BRACKETS.keys.include?(char)
        stack.push(char)
      elsif BRACKETS.values.include?(char)
        return false if stack.empty? || BRACKETS[stack.pop] != char
      end
    end

    stack.empty?
  end
end
