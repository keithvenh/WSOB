class CreateInnings < ActiveRecord::Migration[5.1]
  def change
    create_table :innings do |t|
      t.references :game, foreign_key: true
      t.integer :vis_runs
      t.integer :home_runs

      t.timestamps
    end
  end
end
