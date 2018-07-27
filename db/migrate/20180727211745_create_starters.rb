class CreateStarters < ActiveRecord::Migration[5.1]
  def change
    create_table :starters do |t|
      t.references :team, foreign_key: true
      t.integer :catch
      t.integer :first
      t.integer :second
      t.integer :third
      t.integer :short
      t.integer :left
      t.integer :center
      t.integer :right
      t.integer :dh

      t.timestamps
    end
  end
end
