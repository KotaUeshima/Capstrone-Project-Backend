class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :email, :string
  end
end
