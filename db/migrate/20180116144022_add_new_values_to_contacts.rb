class AddNewValuesToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :estado, :string
  end
end
