class DepthChart < ApplicationRecord
  belongs_to :team
  belongs_to :first, :class_name => "Player"
  belongs_to :second, :class_name => "Player", optional: true
  belongs_to :third, :class_name => "Player", optional: true
  belongs_to :fourth, :class_name => "Player", optional: true
  belongs_to :fifth, :class_name => "Player", optional: true
end
