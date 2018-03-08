class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activity, :float
    add_column :users, :age, :integer
  end
end
