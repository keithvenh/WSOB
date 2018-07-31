require 'csv'

team_text = File.read(Rails.root.join('lib', 'seeds', 'teams.csv'))
team = CSV.parse(team_text, :headers => true, :encoding => 'ISO-8859-1')

team.each do |row|
  Team.create!(
    id: row['id'],
    name: row['name'],
    city: row['city'],
    division: row['div'],
    conference: row['conf'],
    abbr: row['abbr']
  )
end

march_games_text = File.read(Rails.root.join('lib', 'seeds', 'march_games.csv'))
march_game = CSV.parse(march_games_text, :headers => true, :encoding => 'ISO-8859-1')

march_game.each do |row|
  Game.create!(
    id: row['id'],
    date: Date.parse(row['date']),
    visitor_id: row['vis'],
    home_id: row['home'],
    complete: row['com'],
    vis_runs: row['v_r'],
    vis_hits: row['v_h'],
    vis_errors: row['v_e'],
    home_runs: row['h_r'],
    home_hits: row['h_h'],
    home_errors: row['h_e'],
    winner_id: row['w'],
    loser_id: row['l']
  )
end

innings_one_six_text = File.read(Rails.root.join('lib', 'seeds', 'innings_games_one_six.csv'))
inn_one_six = CSV.parse(innings_one_six_text, :headers => true, :encoding => 'ISO-8859-1')

inn_one_six.each do |row|
  Inning.create!(
    game_id: row['game_id'],
    inning: row['inning'],
    vis_runs: row['vis'],
    home_runs: row['home']
  )
end

players_text = File.read(Rails.root.join('lib', 'seeds', 'players.csv'))
players_deck = CSV.parse(players_text, :headers => true, :encoding => 'ISO-8859-1')

players_deck.each do |row|
  Player.create!(
    id: row['id'],
    first_name: row['first'],
    last_name: row['last'],
    team_id: row['team']
  )
end

hitting_card_stats_text = File.read(Rails.root.join('lib', 'seeds', 'hitting_card_stats.csv'))
hitting_card_stats = CSV.parse(hitting_card_stats_text, :headers => true, :encoding => 'ISO-8859-1')

hitting_card_stats.each do |row|
  HittingCardStat.create!(
    player_id: row['player_id'],
    avg: row['avg'],
    ab: row['ab'],
    do: row['do'],
    tr: row['tr'],
    hr: row['hr'],
    rbi: row['rbi'],
    bb: row['bb'],
    so: row['so'],
    sb: row['sb'],
    cs: row['cs'],
    slg: row['slg'],
    obp: row['obp'],
    deck: row['deck'],
    team: row['team']
  )
end

pitching_card_stats_text = File.read(Rails.root.join('lib', 'seeds', 'pitching_card_stats.csv'))
pitching_card_stats = CSV.parse(pitching_card_stats_text, :headers => true, :encoding => 'ISO-8859-1')

pitching_card_stats.each do |row|
  PitchingCardStat.create!(
    player_id: row['player_id'],
    w: row['w'],
    l: row['l'],
    era: row['era'],
    starts: row['starts'],
    sv: row['sv'],
    ip: row['ip'],
    hits_allowed: row['hits'],
    bb: row['bb'],
    so: row['so'],
    hr_allowed: row['hr'],
    deck: row['deck'],
    team: row['team']
  )
end

pitch_stat_march_text = File.read(Rails.root.join('lib', 'seeds', 'pitch_stat_march.csv'))
pitch_stat_march = CSV.parse(pitch_stat_march_text, :headers => true, :encoding => 'ISO-8859-1')

pitch_stat_march.each do |row|
  PitchingStat.create!(
    game_id: row['game_id'],
    team_id: row['team_id'],
    player_id: row['player_id'],
    start: row['start'],
    outs: row['outs'],
    h: row['h'],
    r: row['r'],
    er: row['er'],
    k: row['k'],
    bb: row['bb'],
    hbp: row['hbp'],
    wp: row['wp'],
    do: row['do'],
    tr: row['tr'],
    hr: row['hr'],
    bf: row['bf'],
    w: row['w'],
    l: row['l'],
    s: row['sv'],
    bs: row['bs'],
    hld: row['hld']
  )
end

hit_stat_march_text = File.read(Rails.root.join('lib', 'seeds', 'hit_stat_march.csv'))
hit_stat_march = CSV.parse(hit_stat_march_text, :headers => true, :encoding => 'ISO-8859-1')

hit_stat_march.each do |row|
  BattingStat.create!(
    game_id: row['game_id'],
    team_id: row['team_id'],
    player_id: row['player_id'],
    start: row['start'],
    bat_order: row['bat_order'],
    pos: row['pos'],
    ab: row['ab'],
    r: row['r'],
    h: row['h'],
    rbi: row['rbi'],
    so: row['so'],
    bb: row['bb'],
    hbp: row['hbp'],
    sac: row['sac'],
    sb: row['sb'],
    do: row['do'],
    tr: row['tr'],
    hr: row['hr']
  )
end