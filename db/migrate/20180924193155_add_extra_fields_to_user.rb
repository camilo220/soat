class AddExtraFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :document, :string, null: false
    add_column :users, :document_type, :string, null: false
    add_column :users, :phone, :string, null: false 
  end
end
