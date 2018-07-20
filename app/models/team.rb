class Team < ApplicationRecord

  has_many :away_games, :class_name => "Game", :foreign_key => 'visitor_id'
  has_many :home_games, :class_name => "Game", :foreign_key => 'home_id'

  has_many :wins, :class_name => "Game", :foreign_key => "winner_id"
  has_many :losses, :class_name => "Game", :foreign_key => "loser_id"
  
end
