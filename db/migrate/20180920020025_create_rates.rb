class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string :code, null: false
      t.string :category, null: false
      t.string :sub_category, null: false  
      t.string :unit_of_measurement, null: false
      t.integer :minimum_unit, null: false
      t.integer :maximum_unit, null: false
      t.integer :minimum_age
      t.integer :maximum_age
      # t.string :tags, array: true
      t.float :bonus, null: false
      t.float :total, null: false

      t.timestamps
    end
    add_index :rates, :code, unique: true
  end
end
