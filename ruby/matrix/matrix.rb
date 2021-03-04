=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  def initialize(the_matrix)
    @the_matrix = the_matrix
  end

  def rows
    @rows ||= @the_matrix.each_line.map { |v| v.split.map(&:to_i) }
  end

  def columns
    @columns ||= rows.transpose
  end
end
