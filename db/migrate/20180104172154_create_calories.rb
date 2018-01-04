class CreateCalories < ActiveRecord::Migration[5.0]
  def change
    create_table :calories do |t|
      t.integer :user_id
      t.integer :consumed
      t.integer :deficit
      t.datetime :date

      t.timestamps

    end
  end
end
