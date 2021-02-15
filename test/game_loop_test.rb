require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_loop'

class GameLoopTest < Minitest::Test
  def setup
    @game1 = GameLoop.new
  end


  def test_valid_guess

    guess = ['t', 'y', 'r', 'g']
    assert_equal false, @game1.valid_guess?(guess)
  end
end
