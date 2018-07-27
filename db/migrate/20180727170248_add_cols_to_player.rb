class AddColsToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :primary_pos, :integer
    add_column :players, :deck_team, :string
  end
end
