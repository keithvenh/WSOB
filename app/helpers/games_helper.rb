module GamesHelper

  def game_details(g, t)

    wins = get_wins(t, g)
    losses = get_losses(t, g)
    runs = t == g.home ? g.home_runs : g.vis_runs

    return {wins: wins, losses: losses, runs: runs}

  end

  def game_pitchers(g)

    wp = PitchingStat.where(game: g, w: true).first
    wp_wins = get_wins(wp.player, g)
    wp_losses = get_losses(wp.player, g)

    lp = PitchingStat.where(game: g, l: true).first
    lp_wins = get_wins(lp.player, g)
    lp_losses = get_losses(lp.player, g)

    if PitchingStat.where(game: g, s: true).first != nil
      sp = PitchingStat.where(game: g, s: true).first
      sp_saves = PitchingStat.where('player_id = ? and s = ? and game_id <= ?', sp.player.id, true, g.id).count
      sp_det = {p: sp.player, sv: sp_saves}
    else
      sp_det = false
    end
    

    return {wp: {p: wp.player, w: wp_wins, l: wp_losses}, lp: {p: lp.player, w: lp_wins, l: lp_losses}, sp: sp_det}

  end

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

  def players_to_rest(team)
    six_sided = 1 + rand(3)
    positions = {"C" => "No Rest", "1B" => "No Rest", "2B" => "No Rest", "3B" => "No Rest", "SS" => "No Rest", "LF" => "No Rest", "CF" => "No Rest", "RF" => "No Rest", "DH" => "No Rest"}

    must_rest = []

    case six_sided
    when 1
      center = Player.find(team.starter.center)
      third = Player.find(team.starter.third)
      dh = Player.find(team.starter.dh)
      if (center.hitting_card_stats.sum(:ab) + center.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("CF: #{first_dot_last(center)}")
      end
      if (third.hitting_card_stats.sum(:ab) + third.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("3B: #{first_dot_last(third)}")
      end
      if (dh.hitting_card_stats.sum(:ab) + dh.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("DH: #{first_dot_last(dh)}")
      end
    when 2
      short = Player.find(team.starter.short)
      right = Player.find(team.starter.right)
      first = Player.find(team.starter.first)
      if (short.hitting_card_stats.sum(:ab) + short.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("SS: #{first_dot_last(short)}")
      end
      if (right.hitting_card_stats.sum(:ab) + right.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("RF: #{first_dot_last(right)}")
      end
      if (first.hitting_card_stats.sum(:ab) + first.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("1B: #{first_dot_last(first)}")
      end
    when 3
      second = Player.find(team.starter.second)
      catcher = Player.find(team.starter.catch)
      left = Player.find(team.starter.left)
      if (second.hitting_card_stats.sum(:ab) + second.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("2B: #{first_dot_last(second)}")
      end
      if (catcher.hitting_card_stats.sum(:ab) + catcher.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("C: #{first_dot_last(catcher)}")
      end
      if (left.hitting_card_stats.sum(:ab) + left.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("LF: #{first_dot_last(left)}")
      end
    when 4
      short = Player.find(team.starter.short)
      left = Player.find(team.starter.left)
      first = Player.find(team.starter.first)
      if (short.hitting_card_stats.sum(:ab) + short.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("SS: #{first_dot_last(short)}")
      end
      if (left.hitting_card_stats.sum(:ab) + left.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("LF: #{first_dot_last(left)}")
      end
      if (first.hitting_card_stats.sum(:ab) + first.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("1B: #{first_dot_last(first)}")
      end
    when 5
      second = Player.find(team.starter.second)
      right = Player.find(team.starter.right)
      dh = Player.find(team.starter.dh)
      if (second.hitting_card_stats.sum(:ab) + second.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("2B: #{first_dot_last(second)}")
      end
      if (right.hitting_card_stats.sum(:ab) + right.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("RF: #{first_dot_last(right)}")
      end
      if (dh.hitting_card_stats.sum(:ab) + dh.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("DH: #{first_dot_last(dh)}")
      end
    when 6
      center = Player.find(team.starter.center)
      catcher = Player.find(team.starter.catch)
      third = Player.find(team.starter.third)
      if (center.hitting_card_stats.sum(:ab) + center.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("CF: #{first_dot_last(center)}")
      end
      if (catcher.hitting_card_stats.sum(:ab) + catcher.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("C: #{first_dot_last(catcher)}")
      end
      if (third.hitting_card_stats.sum(:ab) + third.hitting_card_stats.sum(:bb)) < max_at_bats
        must_rest.push("3B: #{first_dot_last(third)}")
      end
    end

    return must_rest


  end
end
