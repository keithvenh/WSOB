class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.date :date
      t.references :visitor
      t.references :home
      t.boolean :complete

      t.timestamps
    end
  end
end
