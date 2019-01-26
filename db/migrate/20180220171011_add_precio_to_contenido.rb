class AddPrecioToContenido < ActiveRecord::Migration
  def change
  	add_column :contenidos, :precio, :integer
  end
end
