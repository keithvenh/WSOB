class CreatePitchingCardStats < ActiveRecord::Migration[5.1]
  def change
    create_table :pitching_card_stats do |t|
      t.references :player, foreign_key: true
      t.integer :w
      t.integer :l
      t.float :era
      t.integer :starts
      t.integer :sv
      t.integer :ip
      t.integer :hits_allowed
      t.integer :bb
      t.integer :so
      t.integer :hr_allowed
      t.string :deck
      t.string :team

      t.timestamps
    end
  end
end
