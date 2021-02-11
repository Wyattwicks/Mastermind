require './lib/sequence'
class User

  def initialize
    @guess = get_guess
  end
  def get_guess
    guess_times = 0
    if guess_times == 0
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,
      (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
      What's your guess?"
      @guess = gets.chomp.downcase
      guess_times += 1
    elsif guess_times == 1
      guess_string = "You've taken #{guess_times} guess"
      @guess = gets.chomp.downcase
      guess_times += 1
    else
      guess_string = "You've taken #{guess_times} guesses"
      @guess = gets.chomp.downcase
      guess_times += 1
    end

  end

  require "pry";binding.pry

  #basically what I want to do is turn the guess in to an array that we can then run an if or each loop
  #to compare the guess array to our sequence.
end
