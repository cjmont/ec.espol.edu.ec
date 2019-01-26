class AddEstadoToContenidos < ActiveRecord::Migration
  def change
  	add_reference :contenidos, :estado, index: true, foreign_key: true
  end
end
