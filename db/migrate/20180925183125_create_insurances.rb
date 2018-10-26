class CreateInsurances < ActiveRecord::Migration[5.1]
  def change
    create_table :insurances do |t|
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :payment_reference, null: false

      t.timestamps
    end
    add_reference :insurances, :vehicle, index: true, null: false
    add_reference :insurances, :rate, index: true, null: false
  end
end
