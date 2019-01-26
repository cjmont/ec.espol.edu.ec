class RemoveValoresInicialsFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :name, :string
    remove_column :contacts, :message, :text
  end
end
