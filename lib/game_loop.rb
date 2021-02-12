require './lib/sequence'
class GameLoop
  attr_reader :guess, :answer

  def initialize
    @guess = []
    @answer = Sequence.new.correct_answer
  end

  def user_guess
    puts "Enter guess here"
    string_guess = gets.chomp.downcase
    if string_guess == 'q' || string_guess == 'quit'
      p 'quit'
    elsif string_guess.length == 4
      @guess = string_guess.split("")
      #compare_correct_amount
      #compare_amount_in_correct_place
      puts " '#{string_guess.upcase}' has #{compare_correct_amount} of the correct elements with #{compare_amount_in_correct_place}
      in the correct positions"
      #remember edge cases (if the answer doesnt include rgby)
    elsif string_guess == 'c' || string_guess == 'cheat'
      p 'cheat'
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

end
game = GameLoop.new.user_guess
#require "pry";binding.pry
