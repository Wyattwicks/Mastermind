require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence'

class TestSequence < Minitest::Test
  def setup
    @sequence = Sequence.new
  end

  def test_it_exists
    assert_instance_of Sequence, @sequence
  end

  def test_if_produces_array_of_4_values
    assert_equal 4, @sequence.correct_answer.length
  end
end
