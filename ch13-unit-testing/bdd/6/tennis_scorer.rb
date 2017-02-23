class TennisScorer

  OPPOSITE_SIDE_OF_NET = { :server => :receiver, :receiver => :server }

  SCORES = [0, 15, 30, 40]

  def initialize
    @score = { :server => 0, :receiver => 0 }
  end
  
  def score
    "#{SCORES[@score[:server]]}-#{SCORES[@score[:receiver]]}"
  end
  
  def give_point_to(player)
    other = OPPOSITE_SIDE_OF_NET[player]
    fail "Unknown player #{player}" unless other
    @score[player] += 1
  end
end
