class Team < ApplicationRecord
  has_many :home_games, :foreign_key => "home_id", :class_name => "Game"
  has_many :away_games, :foreign_key => "visitor_id", :class_name => "Game"

  has_many :wins, :foreign_key => "winner_id", :class_name => "Game"
  has_many :losses, :foreign_key => "loser_id", :class_name => "Game"
end
