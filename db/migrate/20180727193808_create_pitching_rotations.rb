class CreatePitchingRotations < ActiveRecord::Migration[5.1]
  def change
    create_table :pitching_rotations do |t|
      t.references :team, foreign_key: true
      t.integer :rank
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
