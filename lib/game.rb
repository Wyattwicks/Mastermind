#require './lib/sequence'
#require './lib/user'
require './lib/game_loop'

class Game
  # attr_reader :game1

  def initialize
    @game1 = GameLoop.new
  end

  def start
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    first_response = gets.chomp.downcase
    if first_response == 'p' ||  first_response =='play'
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
      puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
      # puts "What's your guess?"
      @game1.play_game

      #run game_loop

    elsif first_response == 'i' || first_response =='instructions'
      puts "instructions"
    elsif first_response == 'q' ||  first_response == 'quit'
      puts "Thanks, come back when you're ready to defeat the Mastermind!"
    else
      puts "Invalid response: game over"
    end
  end
end

new_game = Game.new.start
