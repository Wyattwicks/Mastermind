require './lib/sequence'
require './lib/compare_elements'

class GameLoop
  attr_reader :guess, :answer

  def initialize
    @guess = []
    @answer = Sequence.new.correct_answer
    @cheat = @answer.join.upcase
    @game_over = false
    @guess_count = 0
    @start_time
  end

  def play_game
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
    puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    @start_time = Time.new
    until @game_over == true
      user_guess
    end
  end

  def user_guess
    puts
    puts "Enter guess here"
    print "> "
    string_guess = gets.chomp.downcase
    @guess = string_guess.split("")
    compare = Comparison.new(@guess, @answer)
    if @guess_count == 0
      guess_tense = "guess"
    else
      guess_tense = "guesses"
    end

      if string_guess == 'q' || string_guess == 'quit'
        p "Thanks for playing! Come back when you're ready to defeat the Mastermind!"
        @game_over = true

      elsif string_guess == 'c' || string_guess == 'cheat'
        p "'#{@cheat}' is the random sequence."

      elsif string_guess.length == 4
        if valid_guess?(@guess) == false
          p "Invalid response"
        elsif @guess == @answer
          end_time = Time.now
          @guess_count += 1
          minutes = ((end_time - @start_time) / 60).to_i
          seconds = ((end_time - @start_time).to_i) - (minutes * 60)
          puts "Congratulations! You guessed the sequence '#{@cheat}' in #{@guess_count} #{guess_tense} over #{minutes} minutes and #{seconds} seconds
          Do you want to (p)lay again or (q)uit?"
          print "> "
          winner_statement = gets.chomp.downcase
            if winner_statement == 'q' || winner_statement == 'quit'
              puts "Thanks for playing! You successfully defeated the Mastermind!"
              @game_over = true
            elsif winner_statement == 'p' || winner_statement == 'play'
              @game_over = true
              new_game = GameLoop.new.play_game
            else
              puts "Invalid response: GAME OVER!"
              @game_over = true
            end
        else
          @guess_count += 1
          puts " '#{string_guess.upcase}' has #{compare.correct_amount?} of the correct elements with #{compare.correct_place?}
          in the correct positions. You've taken #{@guess_count} #{guess_tense}."
        end

      elsif string_guess.length > 4
        p 'Answer too long.'
      elsif string_guess.length < 4
        p 'Answer too short.'
      end
  end


  def valid_guess?(guess)
    correct_colors = true
    guess.each do |color|
      if color != 'r' && color != 'b' && color != 'g' && color != 'y'
        correct_colors = false
      end
    end
    correct_colors
  end
end
