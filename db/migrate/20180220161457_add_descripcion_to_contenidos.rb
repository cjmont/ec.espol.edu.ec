class AddDescripcionToContenidos < ActiveRecord::Migration
  def change
    add_column :contenidos, :descripcion, :string
  end
end
