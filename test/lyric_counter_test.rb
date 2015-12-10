require './lib/lyric_counter'
require 'minitest/autorun'
require 'minitest/pride'

class LyricCounterTest < Minitest::Test
  def test_it_counts_one_word
    assert_equal 1, LyricCounter.shazam("pizza")
  end

  def test_it_counts_two_words
    assert_equal 2, LyricCounter.shazam("pizza is")
  end

  def test_it_counts_multiple_words
    assert_equal 4, LyricCounter.shazam("pizza is so good")
  end

  def test_it_counts_uniq_words
    assert_equal 4, LyricCounter.shazam("pizza is so so good")
  end

  def test_it_counts_uniq_words_regardless_of_capitalized_letters
    assert_equal 4, LyricCounter.shazam("pizza is so SO good")
  end

  def test_it_counts_uniq_words_regardless_of_capitalized_letters_or_punctuation
    assert_equal 4, LyricCounter.shazam("pizza is so good! SO good")
  end

  def test_it_counts_uniq_words_from_fixture
    assert_equal 4, LyricCounter.lyric_count("lyric_fixture.txt")
  end
end