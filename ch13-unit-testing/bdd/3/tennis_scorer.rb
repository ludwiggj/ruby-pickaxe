class TennisScorer
  
  def initialize
    @score = { :server => 0, :receiver => 0 }
  end
  
  def score
    "#{@score[:server]*15}-#{@score[:receiver]*15}"
  end
  
  def give_point_to(player)
    @score[player] += 1
  end
end
