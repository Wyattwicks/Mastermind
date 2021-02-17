require './lib/game_loop'

class Game

  def initialize
    @game = GameLoop.new
  end

  def start
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "> "
    first_response = gets.chomp.downcase
    if first_response == 'p' ||  first_response =='play'
      @game.play_game
    elsif first_response == 'i' || first_response =='instructions'
      instructions
      second_response = gets.chomp.downcase

      if second_response == 'p' ||  second_response =='play'
        @game.play_game
      elsif second_response == 'q' ||  second_response == 'quit'
        puts "Thanks, come back when you're ready to defeat the Mastermind!"
      else
        puts "Invalid response: GAME OVER!"
      end

    elsif first_response == 'q' ||  first_response == 'quit'
      puts "Thanks, come back when you're ready to defeat the Mastermind!"
    else
      puts "Invalid response: GAME OVER!"
    end
  end

  def instructions
    puts "The Mastermind has generated a secret code which was recently discovered to be a random sequence of four colors: red, green, blue, and yellow. The code can be any combination, with any of the colors being repeated or excluded."
    puts "The Mastermind will allow unlimited guesses. For every guess it will inform you how many correct colors you have guessed as well as how many of those colors are in the correct order of the sequence."
    puts "To make a guess, enter a four letter sequence of colors using only the first letter of the colors."
    puts "Example: a guess of 'red, green, blue, yellow' should be entered 'rgby'."
    puts "If the Mastermind's code has repeat colors, it will only inform you of a color guessed correctly based on how many times you guess the color."
    puts "Example: If the secret code is 'red, red, red, yellow' and your guess is 'green, red, blue, blue' the Mastermind will only inform you of one correctly guessed color, whereas a guess of 'green, red, blue, red' would inform you of two."
    puts "Now that you understand the challenge, will you (p)lay the Mastermind, or (q)uit?"
    print "> "
  end
end
