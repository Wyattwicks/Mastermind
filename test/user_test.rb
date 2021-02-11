require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence'
require './lib/user.rb'

class TestUser < Minitest::Test
  def setup
  end

  def test_getting_user_input
  user1 = User.new
    assert_equal? ""
  end

  def test_user_guess_1
  end

  def test_user_guess_more_than_1
  end
end
