=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series
  def initialize(numbers)
    @numbers = numbers.chars
  end

  def slices(length)
    raise ArgumentError unless length <= numbers.size
    numbers.each_cons(length).map { |slice| slice.join }
  end

  private
  attr_reader :numbers
end
