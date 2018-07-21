require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'all_pitchers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  Player.create!(
    id: row['id'],
    first_name: row['first'],
    last_name: row['last'],
    team_id: row['t']
  )
end