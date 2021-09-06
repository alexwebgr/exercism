class SimpleCalculator
  ALLOWED_OPERATIONS = %w[+ / *].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    new.calculate(first_operand, second_operand, operation)
  end

  def calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operation
    raise ArgumentError unless first_operand.is_a? Integer
    raise ArgumentError unless second_operand.is_a? Integer

    sum = first_operand.send(operation, second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{sum}"

  rescue ZeroDivisionError
    "Division by zero is not allowed."
  end
end
