class AddUserIdToVehicle < ActiveRecord::Migration[5.1]
  def change
    add_reference :vehicles, :user, index: true, null: false
  end
end