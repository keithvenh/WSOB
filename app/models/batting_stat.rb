class BattingStat < ApplicationRecord
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.calc_stats(b)

    games = BattingStat.where(player_id: b)

    ab = games.sum(:ab) == 0 ? 1 : games.sum(:ab)
    bb = games.sum(:bb)
    hbp = games.sum(:hbp)
    sac = games.sum(:sac)
    hit = games.sum(:h)
    doubles = games.sum(:do)
    triples = games.sum(:tr)
    homeruns = games.sum(:hr)
    xbh = doubles + triples + homeruns
    tb = (hit-xbh) + (doubles*2) + (triples*3) + (homeruns * 4)
    pa = ab + bb + hbp + sac

    avg = hit / ab.to_f
    obp = (hit + bb + hbp) / pa.to_f
    slg = tb / ab.to_f

    return {avg: avg, obp: obp, slg: slg, xbh: xbh, tb: tb}

  end

  def self.batting_league_leaders

    most_runs = BattingStat.group(:player_id).sum(:r).sort_by{|b,r| r}.last

    most_hits = BattingStat.group(:player_id).sum(:h).sort_by{|b,h| h}.last

    most_hr = BattingStat.group(:player_id).sum(:hr).sort_by{|b,hr| hr}.last

    most_rbi = BattingStat.group(:player_id).sum(:rbi).sort_by{|b,rbi| rbi}.last

    most_sb = BattingStat.group(:player_id).sum(:sb).sort_by{|b,sb| sb}.last

    most_double = BattingStat.group(:player_id).sum(:do).sort_by{|b,double| double}.last

    batters_with_games = BattingStat.distinct(:player_id)
    stats = []
    batters_with_games.each do |b|
      result = self.calc_stats(b.player_id)
      stats.push([b.player_id, result[:avg]])
    end
    high_avg = stats.sort { |a,b| a[1] <=> b[1]}.last

    leaders = {
      avg: [Player.find(high_avg[0]), high_avg[1]],
      runs: [Player.find(most_runs[0]), most_runs[1]],
      hits: [Player.find(most_hits[0]), most_hits[1]],
      hr: [Player.find(most_hr[0]), most_hr[1]],
      rbi: [Player.find(most_rbi[0]), most_rbi[1]],
      sb: [Player.find(most_sb[0]), most_sb[1]],
      do: [Player.find(most_double[0]), most_double[1]]
    }

  end
end
