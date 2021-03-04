require 'minitest/autorun'
require_relative 'isogram'

# Common test data version: 1.7.0 74869e8
class IsogramTest < Minitest::Test
  def test_with_custom_repeatables_isogram_is_valid
    input = "xalex,,"
    assert Isogram.new(input,  [' ', ',']).isogram?, "Expected true, '#{input}' is an isogram"
  end


  def test_with_custom_repeatables_isogram_is_valid_2
    input = "ya l e--x, ,"
    assert Isogram.new(input,  [' ', ',', '-']).isogram?, "Expected true, '#{input}' is an isogram"
  end
end

