class PitchingStat < ApplicationRecord
  belongs_to :game
  belongs_to :team
  belongs_to :player

  def self.calc_era_whip(p)
    games = PitchingStat.where(player_id: p)
    innings = games.sum(:outs) / 3.0
    earned_runs = games.sum(:er)
    era = (earned_runs.to_f / innings) * 9

    whip = (games.sum(:bb) + games.sum(:hbp) + games.sum(:h)) / innings

    k_bb = (games.sum(:k)) / (games.sum(:bb) == 0 ? 1 : games.sum(:bb)).to_f


    return {era: era, whip: whip, kbb: k_bb}
  end

  def self.pitching_league_leaders

    most_wins = PitchingStat.where(w: true).group(:player_id).count.sort_by {|p,w| w}.first

    most_saves = PitchingStat.where(s: true).group(:player_id).count.sort_by {|p,s| s}.first

    pitchers_with_games = PitchingStat.distinct(:player_id)
    era_whip = []
    pitchers_with_games.each do |g|
      result = self.calc_era_whip(g.player_id)
      era_whip.push([g.player_id, result[:era], result[:whip], result[:kbb]])
    end
    low_era = era_whip.sort { |a,b| a[1] <=> b[1] }.first
    low_whip = era_whip.sort { |a,b| a[2] <=> b[2] }.first
    high_kbb = era_whip.sort { |a,b| a[3] <=> b[3] }.last

    most_ks = PitchingStat.group(:player_id).sum(:k).sort_by{|p,k| k}.last

    most_bf = PitchingStat.group(:player_id).sum(:bf).sort_by{|p,bf| bf}.last
    


    leaders = {
      wins: [Player.find(most_wins[0]), most_wins[1]],
      saves: [Player.find(most_saves[0]), most_saves[1]],
      era: [Player.find(low_era[0]), low_era[1]],
      k: [Player.find(most_ks[0]), most_ks[1]],
      whip: [Player.find(low_whip[0]), low_whip[2]],
      bf: [Player.find(most_bf[0]), most_bf[1]],
      kbb: [Player.find(high_kbb[0]), high_kbb[3]]
    }



  end
end
