require 'minitest/autorun'
require_relative 'isogram'

# Common test data version: 1.7.0 74869e8
class IsogramTest < Minitest::Test
  def test_empty_string
    # skip
    input = ""
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_isogram_with_only_lower_case_characters

    input = "isogram"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_word_with_one_duplicated_character

    input = "eleven"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_word_with_one_duplicated_character_from_the_end_of_the_alphabet

    input = "zzyzx"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_longest_reported_english_isogram

    input = "subdermatoglyphic"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_word_with_duplicated_character_in_mixed_case

    input = "Alphabet"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_word_with_duplicated_character_in_mixed_case_lowercase_first

    input = "alphAbet"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_hypothetical_isogrammic_word_with_hyphen

    input = "thumbscrew-japingly"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_hypothetical_word_with_duplicated_character_following_hyphen

    input = "thumbscrew-jappingly"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_isogram_with_duplicated_hyphen

    input = "sixyearold"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_made_up_name_that_is_an_isogram

    input = "Emily Jung Schwartzkopf"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_duplicated_character_in_the_middle

    input = "accentor"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_same_first_and_last_characters

    input = "angola"
    # refute Isogram.isogram?(input)
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_second_order_isogram_is_valid
    input = "deed"
    assert Isogram.new(input).isogram?(2), "Expected true, '#{input}' is an isogram"
  end

  def test_third_order_isogram_is_valid
    input = "deeded"
    assert Isogram.new(input).isogram?(3), "Expected true, '#{input}' is an isogram"
  end


  def test_with_custom_repeatables_isogram_is_valid
    input = "alex,,"
    assert Isogram.new(input,  [" ", ","]).isogram?, "Expected true, '#{input}' is an isogram"
  end


  def test_with_custom_repeatables_isogram_is_valid_2
    input = "a l e--x, ,"
    assert Isogram.new(input,  [" ", "-", ","]).isogram?, "Expected true, '#{input}' is an isogram"
  end


  def test_with_custom_repeatables_isogram_is_valid_3
    input = "a*-**--**"
    refute Isogram.new(input,  ["*"]).isogram?, "Expected false, '#{input}' is not an isogram"
  end

  def test_with_custom_repeatables_isogram_is_valid_4
    input = "batmen/"
    assert Isogram.new(input,  ["\/"]).isogram?, "Expected true, '#{input}' is an isogram"
  end

  def test_with_custom_repeatables_isogram_is_valid_5
    input = "batmen//"
    assert Isogram.new(input,  ["\/"]).isogram?, "Expected true, '#{input}' is an isogram"
  end

  # def test_with_custom_repeatables_isogram_is_valid_7
  #   buffalo = %q|Buffalo buffalo buffalo Buffalo buffalo buffalo Buffalo buffalo|
  #   assert Isogram.new(input,  ["\/"]).isogram?, "Expected true, '#{input}' is an isogram"
  # end

  def test_really_long_isogram
    input = "Bang Bang Bang Bang Bang Bang Bang Bang"
    assert Isogram.new(input).isogram?(8), "Expected true, '#{input}' is an isogram"
  end

  def test_really_long_isogram_2
    input = "Bang Bang Bang Bang Bang Bang Bang Bangs"
    refute Isogram.new(input).isogram?(8), "Expected false, '#{input}' is not an isogram"
  end
end
