module ApplicationHelper

  def max_at_bats
    twenty_sided = 1 + rand(20)

    at_bats = 600

    case twenty_sided
    when 1
      at_bats = 599
    when 2..3
      at_bats = 574
    when 4..6
      at_bats = 549
    when 7..8
      at_bats = 524
    when 9..10
      at_bats = 499
    when 11..13
      at_bats = 474
    when 14..15
      at_bats = 449
    when 16..18
      at_bats = 424
    when 19
      at_bats = 399
    when 20
      at_bats = 374
    end

    return at_bats
  end

  
  def players_to_rest
    six_sided = 1 + rand(6)
    positions = {"C" => "No Rest", "1B" => "No Rest", "2B" => "No Rest", "3B" => "No Rest", "SS" => "No Rest", "LF" => "No Rest", "CF" => "No Rest", "RF" => "No Rest", "DH" => "No Rest"}

    case six_sided
    when 1
      positions["CF"] = max_at_bats
      positions["3B"] = max_at_bats
      positions["DH"] = max_at_bats
    when 2
      positions["SS"] = max_at_bats
      positions["RF"] = max_at_bats
      positions["1B"] = max_at_bats
    when 3
      positions["2B"] = max_at_bats
      positions["C"] = max_at_bats
      positions["LF"] = max_at_bats
    when 4
      positions["SS"] = max_at_bats
      positions["LF"] = max_at_bats
      positions["1B"] = max_at_bats
    when 5
      positions["2B"] = max_at_bats
      positions["RF"] = max_at_bats
      positions["DH"] = max_at_bats
    when 6
      positions["CF"] = max_at_bats
      positions["C"] = max_at_bats
      positions["3B"] = max_at_bats
    end

    return positions


  end

  def team_wins_losses(team, date)

    games = Game.where("date <= ?", date)

    wins = games.where(winner: team.id).count

    losses = games.where(loser: team.id).count

    return [wins, losses]
  end

  def pitcher_wins_losses(player, game)

    games = PitchingStat.where("game_id <= ?", game.id) 

    games = games.where(player_id: player.id)

    wins = games.where(w: true).count

    losses = games.where(l: true).count

    return [wins, losses]
  end

  def standings(div)
    teams = Team.where(division: div)

    team_list = {}

    teams.each do |t|
      rec = team_wins_losses(t, Date.today)
      team_list.store(t.name, { :id => t.id, :wins => rec[0], :losses => rec[1], :win_pct => (rec[0]+rec[1] > 0) ? ((rec[0].to_f)/(rec[0]+rec[1])) : 0.000 })
    end

    return team_list.sort_by { |k,v| v[:win_pct] }.reverse


    
  end

  def pos_to_string(pos)
    case pos
    when 1
      return "P"
    when 2
      return "C"
    when 3
      return "1B"
    when 4
      return "2B"
    when 5
      return "3B"
    when 6
      return "SS"
    when 7
      return "LF"
    when 8
      return "CF"
    when 9
      return "RF"
    when 10
      return "DH"
    when 11
      return "PH"
    when 12
      return "PR"
    end
  end

  def num_to_string(num)
    case num
    when 2
      return 'two'
    when 4
      return 'four'
    when 6
      return 'six'
    when 8
      return 'eight'
    end
  end

  def outs_to_ip(outs)
    full = outs/3
    partial = outs % 3

    return "#{full}.#{partial}"
  end

  def calc_game_score(game)
    score = 40
    score += (game.outs * 2)
    score += game.k
    score -= (game.h * 2)
    score -= (game.bb * 2)
    score -= (game.hbp * 2)
    score -= (game.r * 3)
    score -= (game.hr * 6)

    return score
  end
end
