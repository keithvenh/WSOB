class Lineup < ApplicationRecord
  belongs_to :team
  belongs_to :one_player, :class_name => "Player"
  belongs_to :two_player, :class_name => "Player"
  belongs_to :three_player, :class_name => "Player"
  belongs_to :four_player, :class_name => "Player"
  belongs_to :five_player, :class_name => "Player"
  belongs_to :six_player, :class_name => "Player"
  belongs_to :seven_player, :class_name => "Player"
  belongs_to :eight_player, :class_name => "Player"
  belongs_to :nine_player, :class_name => "Player"
end
