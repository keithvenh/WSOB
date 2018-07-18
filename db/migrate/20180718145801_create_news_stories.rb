class CreateNewsStories < ActiveRecord::Migration[5.1]
  def change
    create_table :news_stories do |t|
      t.references :game, foreign_key: true
      t.text :story

      t.timestamps
    end
  end
end
