class CreateInnings < ActiveRecord::Migration[5.1]
  def change
    create_table :innings do |t|
      t.references :game, foreign_key: true
      t.integer :inning
      t.integer :vis_runs, default: 0
      t.integer :home_runs, default: 0

      t.timestamps
    end
  end
end
