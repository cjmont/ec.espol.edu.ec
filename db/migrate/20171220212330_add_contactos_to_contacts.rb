class AddContactosToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :telefono, :string
    add_column :contacts, :mensaje, :text
  end
end
