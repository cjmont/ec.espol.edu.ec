class AddTelefonoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :telefono, :string
  end
end
