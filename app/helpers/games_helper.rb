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
end
