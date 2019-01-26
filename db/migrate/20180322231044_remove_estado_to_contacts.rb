class RemoveEstadoToContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :estado, :string
  end
end
