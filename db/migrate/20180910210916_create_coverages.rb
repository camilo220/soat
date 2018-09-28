class CreateCoverages < ActiveRecord::Migration[5.1]
  def change
    create_table :coverages do |t|
      t.float :death
      t.float :medical_expenses
      t.float :permanent_inability
      t.float :transportation_expenses
      t.string :unit, null: false 

      t.timestamps
    end
  end
end
