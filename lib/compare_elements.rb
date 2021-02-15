class Comparison

  def initialize(guess, answer)
    @guess = guess
    @answer = answer

  end

  def correct_place?
    correct_place = 0

    @guess.zip(@answer).map do |color_guess, correct_color|
      if color_guess == correct_color
        correct_place += 1
      end
    end

     correct_place
  end

  def correct_amount?

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

    guess_reds.zip(answer_reds).map do |guess_color, answer_color|
      if guess_color == answer_color
        number_correct += 1
      end
    end

    guess_greens.zip(answer_greens).map do |guess_color, answer_color|
      if guess_color == answer_color
        number_correct += 1
      end
    end

    guess_blues.zip(answer_blues).map do |guess_color, answer_color|
      if guess_color == answer_color
        number_correct += 1
      end
    end

    guess_yellows.zip(answer_yellows).map do |guess_color, answer_color|
      if guess_color == answer_color
        number_correct += 1
      end
    end
    #Make sure to delete these 2 lines
    puts "answer: #{@answer}"
    puts "guess: #{@guess}"

     number_correct
  end
end
