class Player < ApplicationRecord
  belongs_to :team
  has_many :lineups
  has_many :depth_charts
  has_many :hitting_card_stats
  has_many :pitching_card_stats
end
