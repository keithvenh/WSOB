class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.date :date
      t.references :visitor, foregin_key: true
      t.references :home, foreign_key: true
      t.boolean :complete, default: false
      t.integer :vis_runs
      t.integer :vis_hits
      t.integer :vis_errors
      t.integer :home_runs
      t.integer :home_hits
      t.integer :home_errors
      t.references :winner, foregin_key: true
      t.references :loser, foreign_key: true

      t.timestamps
    end
  end
end
