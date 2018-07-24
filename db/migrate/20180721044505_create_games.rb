class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.date :date
      t.references :visitor, index: true
      t.references :home, index: true
      t.boolean :complete
      t.integer :vis_runs
      t.integer :vis_hits
      t.integer :vis_errors
      t.integer :home_runs
      t.integer :home_hits
      t.integer :home_errors
      t.references :winner, index: true
      t.references :loser, index: true

      t.timestamps
    end
  end
end
