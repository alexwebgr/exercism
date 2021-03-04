require 'minitest/autorun'
require_relative 'scrabble_score'

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero

    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero

    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word

    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word

    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters

    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more

    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive

    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_scores_with_different_tile_set
    hawaiian = {'A' => 1, 'N' => 3, 'O' => 2, 'P' => 8, 'E' => 4, 'H' => 6, 'U' => 5, 'I' => 3, 'W' => 9, 'K' => 2, 'L' => 7, 'M' => 8, '‘' => 0}
    assert_equal 17, Scrabble.new('aloha', hawaiian).score
  end

  def test_scores_with_different_tile_set_2
    hawaiian = {'A' => 1, 'N' => 3, 'O' => 2, 'P' => 8, 'E' => 4, 'H' => 6, 'U' => 5, 'I' => 3, 'W' => 9, 'K' => 2, 'L' => 7, 'M' => 8, '‘' => 0}
    assert_equal 14, Scrabble.new('he‘e', hawaiian).score
  end

  def test_scores_with_different_tile_set_3
    hawaiian = {'A' => 1, 'N' => 3, 'O' => 2, 'P' => 8, 'E' => 4, 'H' => 6, 'U' => 5, 'I' => 3, 'W' => 9, 'K' => 2, 'L' => 7, 'M' => 8, '‘' => 0}
    assert_equal 94, Scrabble.new('Humuhumunukunukuapuaa', hawaiian).score
  end

  def test_convenient_scoring

    assert_equal 13, Scrabble.score('alacrity')
  end
end
