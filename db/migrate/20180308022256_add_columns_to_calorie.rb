class AddColumnsToCalorie < ActiveRecord::Migration[5.0]
  def change
    add_column :calories, :weight, :float
    add_column :calories, :tdee, :integer
  end
end
