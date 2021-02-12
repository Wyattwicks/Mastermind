require './lib/sequence'
require './lib/game_loop'
#if we make a class for the user guess add it here

class Compare
  attr_reader :guess, :answer

  def initialize
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
    end

    #this may work better for the correct amount thing.
    def correct_amount
      correct = (@guess & @answer)
      puts "#{correct.length}"
    end

end
