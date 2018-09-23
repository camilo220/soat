class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :license, null: false
      t.string :category, null: false
      t.string :sub_category, null: false
      t.string :unit_of_measurement, null: false
      t.integer :unit_value, null: false
      t.date :year

      t.timestamps
    end
    add_index :vehicles, :license, unique: true
    add_reference :vehicles, :rate, foreign_key: true, index: true, null: false
  end
end
