class Comparison

  def initialize(guess, answer)
    @guess = guess
    @answer = answer
    @number_correct = 0

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

    color_comparison(guess_reds, answer_reds)
    color_comparison(guess_greens, answer_greens)
    color_comparison(guess_blues, answer_blues)
    color_comparison(guess_yellows, answer_yellows)

     @number_correct
  end

  def color_comparison(guess_color, answer_color)
    guess_color.zip(answer_color).map do |guess_color, answer_color|
      if guess_color == answer_color
        @number_correct += 1
      end
    end
  end
end
