class CreateBattingStats < ActiveRecord::Migration[5.1]
  def change
    create_table :batting_stats do |t|
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.boolean :start, default: true
      t.integer :order
      t.integer :pos
      t.integer :ab
      t.integer :r, default: 0
      t.integer :h, default: 0
      t.integer :rbi, default: 0
      t.integer :so, default: 0
      t.integer :bb, default: 0
      t.integer :hbp, default: 0
      t.integer :sac, default: 0
      t.integer :sb, default: 0
      t.integer :do, default: 0
      t.integer :tr, default: 0
      t.integer :hr, default: 0

      t.timestamps
    end
  end
end
