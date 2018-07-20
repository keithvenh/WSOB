class CreatePitchingStats < ActiveRecord::Migration[5.1]
  def change
    create_table :pitching_stats do |t|
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.integer :outs
      t.integer :h
      t.integer :r
      t.integer :er
      t.integer :k
      t.integer :bb
      t.integer :hbp
      t.integer :wp
      t.integer :do
      t.integer :tr
      t.integer :hr
      t.integer :bf
      t.boolean :w
      t.boolean :l
      t.boolean :s
      t.boolean :bs
      t.boolean :hld

      t.timestamps
    end
  end
end
