#require './lib/sequence'
#require './lib/user'

class Game

  def initialize
  end

  def start
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    first_response = gets.chomp.downcase
    if first_response == 'p' ||  first_response =='play'
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
      puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
      puts "What's your guess?"
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

game = Game.new
game.start
