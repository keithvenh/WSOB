class CreatePitchingStats < ActiveRecord::Migration[5.1]
  def change
    create_table :pitching_stats do |t|
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.boolean :start, default: false
      t.integer :outs, null: false
      t.integer :h, default: 0
      t.integer :r, default: 0
      t.integer :er, default: 0
      t.integer :k, default: 0
      t.integer :bb, default: 0
      t.integer :hbp, default: 0
      t.integer :wp, default: 0
      t.integer :do, default: 0
      t.integer :tr, default: 0
      t.integer :hr, default: 0
      t.integer :bf, default: 0
      t.boolean :w, default: 0
      t.boolean :l, default: 0
      t.boolean :s, default: 0
      t.boolean :bs, default: 0
      t.boolean :hld, default: 0

      t.timestamps
    end
  end
end
