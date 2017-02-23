class TennisScorer

  OPPOSITE_SIDE_OF_NET = { :server => :receiver, :receiver => :server }

  SCORES = [0, 15, 30, 40]
  
  @status = :in_progress

  def initialize
    @score = { :server => 0, :receiver => 0 }
  end
  
  def score
    if (@status == :deuce)
      "Deuce"
    else
      "#{SCORES[@score[:server]]}-#{SCORES[@score[:receiver]]}"
    end
  end
  
  def give_point_to(player)
    other = OPPOSITE_SIDE_OF_NET[player]
    fail "Unknown player #{player}" unless other
    @score[player] += 1

    if (@score[player] == 3) && (@score[other] == 3)
      @status = :deuce
    end
  end
end
