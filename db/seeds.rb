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

hof_deck_text = File.read(Rails.root.join('lib', 'seeds', 'hof_deck.csv'))
hof_deck = CSV.parse(hof_deck_text, :headers => true, :encoding => 'ISO-8859-1')

hof_deck.each do |row|
  Player.create!(
    id: row['id'],
    first_name: row['first'],
    last_name: row['last'],
    team_id: row['team'],
    deck: row['deck']
  )
end

ninety_eight_deck_text = File.read(Rails.root.join('lib', 'seeds', '1998_roster.csv'))
ninety_eight_deck = CSV.parse(ninety_eight_deck_text, :headers => true, :encoding => 'ISO-8859-1')

ninety_eight_deck.each do |row|
  Player.create!(
    first_name: row['first'],
    last_name: row['last'],
    team_id: row['team'],
    deck: row['deck']
  )
end