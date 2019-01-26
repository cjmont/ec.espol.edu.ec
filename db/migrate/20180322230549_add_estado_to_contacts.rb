class AddEstadoToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :estado, index: true, foreign_key: true
  end
end
