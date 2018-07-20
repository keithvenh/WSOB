class AddStartToPitchingStat < ActiveRecord::Migration[5.1]
  def change
    add_column :pitching_stats, :start, :boolean
  end
end
