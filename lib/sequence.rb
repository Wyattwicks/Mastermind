class Sequence
  def initialize
    @hash = {
      'r' => 4,
      'g' => 4,
      'b' => 4,
      'y' => 4
    }
  end

  def correct_answer
    set_of_colors = []

    @hash.each do |color, occurrences|
      occurrences.times {set_of_colors << color}
    end

    split_colors = set_of_colors.shuffle.each_slice(4).to_a

    split_colors[0]
  end
end
