class AddTelefonoToPedidos < ActiveRecord::Migration
  def change
    add_column :pedidos, :telefono, :string
    add_column :pedidos, :shipped, :boolean, default: false
  end
end
