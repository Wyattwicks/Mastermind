require 'minitest/autorun'
require 'minitest/pride'
require './lib/compare_elements'


class ComparisonTest < Minitest::Test
  def setup
    @guess = ['y', 'r', 'g', 'b']
    @answer = ['y', 'g', 'r', 'r']
    @compare = Comparison.new(@guess, @answer)
  end

  def test_compare_amount_in_correct_place

    assert_equal 1, @compare.correct_place?
  end

  def test_compare_correct_amount

    assert_equal 3, @compare.correct_amount?
  end
end
