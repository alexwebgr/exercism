=begin
Write your code for the 'Spiral Matrix' exercise in this file. Make the tests in
`spiraL_matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/spiral-matrix` directory.
=end

class SpiralMatrix
  attr_reader :radius

  def initialize(radius)
    @radius = radius
  end

  def matrix
    matrix = Array.new(radius) { Array.new(radius) }
    count = 1
    start_row = 0
    start_col = 0
    end_row = radius - 1
    end_col = radius - 1

    while start_row <= end_row && start_col <= end_col
      # Fill top row
      (start_col..end_col).each do |i|
        matrix[start_row][i] = count
        count += 1
      end
      start_row += 1

      # Fill right column
      (start_row..end_row).each do |i|
        matrix[i][end_col] = count
        count += 1
      end
      end_col -= 1

      # Fill bottom row
      if start_row <= end_row
        (end_col).downto(start_col).each do |i|
          matrix[end_row][i] = count
          count += 1
        end
        end_row -= 1
      end

      # Fill left column
      if start_col <= end_col
        (end_row).downto(start_row).each do |i|
          matrix[i][start_col] = count
          count += 1
        end
        start_col += 1
      end
    end

    matrix
  end
end
