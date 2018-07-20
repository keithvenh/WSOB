class AddColsToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :vis_runs, :int
    add_column :games, :vis_hits, :int
    add_column :games, :vis_errors, :int
    add_column :games, :home_runs, :int
    add_column :games, :home_hits, :int
    add_column :games, :home_errors, :int
  end
end
