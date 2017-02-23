class TennisScorer

  OPPOSITE_SIDE_OF_NET = { :server => :receiver, :receiver => :server }

  SCORES = [0, 15, 30, 40]
  
  def initialize
    @score = { :server => 0, :receiver => 0 }
    @game_over = false
  end
 
  def both_players_have_won_at_least_three_points
    @score[:server] >= 3 && @score[:receiver] >= 3
  end

  def player_has_won(player)
    if (both_players_have_won_at_least_three_points)
      other = OPPOSITE_SIDE_OF_NET[player]
      @score[player] - @score[other] == 2
    else
      @score[player] == 4
    end
  end

  def won(player)
    case player
    when :server
      "W-L"
    when :receiver
      "L-W"
    end
  end

  def advantage(player)
    "A-#{player.to_s}"
  end
  
  def score
    if player_has_won(:server)
      won(:server)
    elsif player_has_won(:receiver)
      won(:receiver)
    elsif both_players_have_won_at_least_three_points
      case (@score[:server] - @score[:receiver])
      when 1
        advantage(:server)
      when 0
        "Deuce"
      when -1
        advantage(:receiver)
      end
    else
      "#{SCORES[@score[:server]]}-#{SCORES[@score[:receiver]]}"
    end
  end
  
  def give_point_to(player)
    other = OPPOSITE_SIDE_OF_NET[player]

    fail "Unknown player #{player}" unless other

    fail "Game over, result: #{score}" if @game_over

    @score[player] += 1
    @game_over = player_has_won(player)
  end
end
