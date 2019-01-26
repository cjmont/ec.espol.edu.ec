class AddNewValuesToContenido < ActiveRecord::Migration
  def change
    add_column :contenidos, :dirigido_a, :text
  end
end
