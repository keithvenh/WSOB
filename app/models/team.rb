class Team < ApplicationRecord

  has_many :away_games, :class_name => "Game", :foreign_key => 'visitor_id'
  has_many :home_games, :class_name => "Game", :foreign_key => 'home_id'
  
end
