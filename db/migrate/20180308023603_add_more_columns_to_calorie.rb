class AddMoreColumnsToCalorie < ActiveRecord::Migration[5.0]
  def change
    add_column :calories, :cumulative_cals, :integer
    add_column :calories, :cumulative_deficit, :integer
    add_column :calories, :proj_loss, :float
    add_column :users, :height, :integer 
  end
end
