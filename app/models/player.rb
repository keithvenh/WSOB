class Player < ApplicationRecord
  belongs_to :team
  has_many :lineups
  has_many :depth_charts
end
