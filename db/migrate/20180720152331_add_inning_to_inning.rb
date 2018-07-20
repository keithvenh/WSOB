class AddInningToInning < ActiveRecord::Migration[5.1]
  def change
    add_column :innings, :inning, :integer
  end
end
