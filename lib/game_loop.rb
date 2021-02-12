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
      compare_guess
      #remember edge cases (if the answer doesnt include rgby)
    elsif string_guess == 'c' || string_guess == 'cheat'
      p 'cheat'
    elsif string_guess.length > 4
      p 'Answer too long'
    elsif string_guess.length < 4
      p 'Answer too short'
    end
  end

  def compare_guess

    number_correct = 0

     @guess.each do |guess|
       @answer.uniq.each do |answer|

          if guess == answer
            number_correct += 1
          end
        end
    end

    puts "answer: #{@answer}"
    puts "guess: #{@guess}"
    p number_correct
  end

  # def answer_to_hash
  #
  #   hash_of_answers = {}
  #   reds= []
  #   greens = []
  #   blues = []
  #   yellows = []
  #   @answer.find_all do |answer|
  #     if answer == 'r'
  #       reds << answer
  #     elsif answer == 'g'
  #       greens << answer
  #     elsif answer == 'b'
  #       blues << answer
  #     elsif answer == 'y'
  #       yellows << answer
  #     end
  #   end
  #
  #
  #     hash_of_answers[reds[0]] = reds.length
  #     hash_of_answers[greens[0]] = greens.length
  #     hash_of_answers[blues[0]] = blues.length
  #     hash_of_answers[yellows[0]] = yellows.length
  #     p hash_of_answers
  # end

end
game = GameLoop.new.user_guess
#require "pry";binding.pry
