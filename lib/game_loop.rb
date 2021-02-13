require './lib/sequence'
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
    @start_time = Time.new
    until @game_over == true
      user_guess
    end
  end

  def user_guess
    # start_time = Time.now
    puts "Enter guess here"
    print "> "
    string_guess = gets.chomp.downcase
    @guess = string_guess.split("")

      if string_guess == 'q' || string_guess == 'quit'
        p 'Thanks for playing!'
        @game_over = true
      elsif string_guess == 'c' || string_guess == 'cheat'
        p "'#{@cheat}' is the random sequence."
      elsif string_guess.length == 4
        # @guess = string_guess.split("")

        if valid_guess?(@guess) == false
          p "Invalid response"
        elsif @guess == @answer
          end_time = Time.now
          @guess_count += 1
          minutes = ((end_time - @start_time) / 60).to_i
          seconds = ((end_time - @start_time).to_i) - (minutes * 60)

          puts "Congratulations! You guessed the sequence '#{@cheat}' in #{@guess_count} guesses over #{minutes} minutes and #{seconds} seconds
          Do you want to (p)lay again or (q)uit?"
          print "> "
          winner_statement = gets.chomp.downcase
            if winner_statement == 'q' || winner_statement == 'quit'
              puts "Thanks for playing!"
              @game_over = true
            elsif winner_statement == 'p' || winner_statement == 'play'
              @game_over = true
              new_game = GameLoop.new.play_game
            end

        else
          @guess_count += 1

          puts " '#{string_guess.upcase}' has #{compare_correct_amount} of the correct elements with #{compare_amount_in_correct_place}
          in the correct positions"
        end

      elsif string_guess.length > 4
        p 'Answer too long'
      elsif string_guess.length < 4
        p 'Answer too short'
      end
  end

  def compare_amount_in_correct_place
    correct_place = 0
      if @answer[0] == @guess[0]
        correct_place +=1
      end
      if @answer[1] == @guess[1]
        correct_place +=1
      end
      if @answer[2] == @guess[2]
        correct_place +=1
      end
      if @answer[3] == @guess[3]
        correct_place +=1
      end

     correct_place
  end

  def compare_correct_amount

    answer_reds= []
    answer_greens = []
    answer_blues = []
    answer_yellows = []

    guess_reds= []
    guess_greens = []
    guess_blues = []
    guess_yellows = []

    number_correct = 0

    @answer.find_all do |answer|
      if answer == 'r'
        answer_reds << answer
      elsif answer == 'g'
        answer_greens << answer
      elsif answer == 'b'
        answer_blues << answer
      elsif answer == 'y'
        answer_yellows << answer
      end
    end

    @guess.find_all do |guess|
      if guess == 'r'
        guess_reds << guess
      elsif guess == 'g'
        guess_greens << guess
      elsif guess == 'b'
        guess_blues << guess
      elsif guess == 'y'
        guess_yellows << guess
      end
    end

    if answer_reds.length > guess_reds.length
      number_correct += guess_reds.length
    elsif answer_reds.length < guess_reds.length
      number_correct += answer_reds.length
    else
      number_correct += answer_reds.length
    end

    if answer_greens.length > guess_greens.length
      number_correct += guess_greens.length
    elsif answer_greens.length < guess_greens.length
      number_correct += answer_greens.length
    else
      number_correct += answer_greens.length
    end

    if answer_blues.length > guess_blues.length
      number_correct += guess_blues.length
    elsif answer_blues.length < guess_blues.length
      number_correct += answer_blues.length
    else
      number_correct += answer_blues.length
    end

    if answer_yellows.length > guess_yellows.length
      number_correct += guess_yellows.length
    elsif answer_yellows.length < guess_yellows.length
      number_correct += answer_yellows.length
    else
      number_correct += answer_yellows.length
    end

    puts "answer: #{@answer}"
    puts "guess: #{@guess}"

     number_correct
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

  # def winner
  #   if @answer == @guess
  #
  #     puts "Congratulations! You guessed the sequence '#{@cheat}' in guesses over TIME
  #     Do you want to (p)lay again or (q)uit?"
  #   end
  # end
  # def correct_amount
  #   correct = (@guess & @answer)
  #   puts "correct: #{correct.length}"
  # end
end
# game = GameLoop.new.play_game

#require "pry";binding.pry
