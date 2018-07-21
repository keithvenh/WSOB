class CreateLineups < ActiveRecord::Migration[5.1]
  def change
    create_table :lineups do |t|
      t.references :team
      t.integer :one_pos
      t.references :one_player
      t.integer :two_pos
      t.references :two_player
      t.integer :three_pos
      t.references :three_player
      t.integer :four_pos
      t.references :four_player
      t.integer :five_pos
      t.references :five_player
      t.integer :six_pos
      t.references :six_player
      t.integer :seven_pos
      t.references :seven_player
      t.integer :eight_pos
      t.references :eight_player
      t.integer :nine_pos
      t.references :nine_player

      t.timestamps
    end
  end
end
