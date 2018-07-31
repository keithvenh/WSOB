class CreateHittingCardStats < ActiveRecord::Migration[5.1]
  def change
    create_table :hitting_card_stats do |t|
      t.references :player, foreign_key: true
      t.float :avg
      t.integer :ab
      t.integer :do
      t.integer :tr
      t.integer :hr
      t.integer :rbi
      t.integer :bb
      t.integer :so
      t.integer :sb
      t.integer :cs
      t.float :slg
      t.float :obp
      t.string :deck
      t.string :team

      t.timestamps
    end
  end
end
