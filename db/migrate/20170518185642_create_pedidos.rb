class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :nombre
      t.string :email
      t.text :direccion
      t.string :ciudad
      t.string :pais

      t.timestamps null: false
    end
  end
end
