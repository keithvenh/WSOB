class AddWinnerLoserToGame < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :winner, foreign_key: true
    add_reference :games, :loser, foreign_key: true
  end
end
