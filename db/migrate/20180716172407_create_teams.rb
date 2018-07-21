class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.string :division
      t.string :conference
      t.string :abbr

      t.timestamps
    end
  end
end
