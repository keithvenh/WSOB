class CreateBattingStats < ActiveRecord::Migration[5.1]
  def change
    create_table :batting_stats do |t|
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.boolean :start
      t.integer :order
      t.integer :pos
      t.integer :ab
      t.integer :r
      t.integer :h
      t.integer :rbi
      t.integer :so
      t.integer :bb
      t.integer :hbp
      t.integer :sac
      t.integer :sb
      t.integer :do
      t.integer :tr
      t.integer :hr

      t.timestamps
    end
  end
end
