class AddPedidoToItemCalendarios < ActiveRecord::Migration
  def change
    add_reference :item_calendarios, :pedido, index: true, foreign_key: true
  end
end
