class Game < ApplicationRecord

  belongs_to :visitor, :class_name => "Team"
  belongs_to :home, :class_name => "Team"

  belongs_to :winner, :class_name => "Team", optional: true
  belongs_to :loser, :class_name => "Team", optional: true
  
  has_many :innings
end
