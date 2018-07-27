module ApplicationHelper

# CALCULATE WINS FOR A GIVEN ENTITY
  def get_wins(entity, game)

    if entity.class == Team
      wins = Game.where("date <= ? and winner_id = ?", game.date, entity.id).count
    elsif entity.class == Player
      wins = PitchingStat.where("game_id <= ? and player_id = ? and w = ?", game.id, entity.id, true).count
    end

    return wins

  end

#CALCULATE LOSSES FOR A GIVEN ENTITY

  def get_losses(entity, game)

    if entity.class == Team
      losses = Game.where("date <= ? and loser_id = ?", game.date, entity.id).count
    elsif
      losses = PitchingStat.where("game_id <= ? and player_id = ? and l = ?", game.id, entity.id, true).count
    end

    return losses

  end

# CALCULATE BATTING AVERAGE

  def calc_avg(player, game: false)

    if game
      ab = player.batting_stats.where(game: game).first.ab
      hits = player.batting_stats.where(game: game).first.h
    else
      ab = player.batting_stats.sum(:ab)
      hits = player.batting_stats.sum(:h)
    end

    ab = 1 if ab == 0
    return (hits/ab.to_f)

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

  def first_dot_last(p)
    return "#{p.first_name[0]}. #{p.last_name}"
  end

  def last_comma_first(p)
    return "#{p.last_name}, #{p.first_name[0]}"
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
    when 10
      return "ten"
    when 12
      return "twelve"
    when 14
      return "fourteen"
    when 16
      return "sixteen"
    when 18
      return "eighteen"
    when 20
      return "twenty"
    when 22
      return "twenty-two"
    when 24
      return "twenty-four"
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
