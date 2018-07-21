class CreateDepthCharts < ActiveRecord::Migration[5.1]
  def change
    create_table :depth_charts do |t|
      t.references :team, foreign_key: true
      t.integer :pos
      t.references :first, foreign_key: true
      t.references :second, foreign_key: true
      t.references :third, foreign_key: true
      t.references :fourth, foreign_key: true
      t.references :fifth, foreign_key: true

      t.timestamps
    end
  end
end
