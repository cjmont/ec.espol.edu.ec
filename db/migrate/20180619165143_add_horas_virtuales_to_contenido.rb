class AddHorasVirtualesToContenido < ActiveRecord::Migration
  def change
  	add_column :contenidos, :horas_virtuales, :integer
  end
end
