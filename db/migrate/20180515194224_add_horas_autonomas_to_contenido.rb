class AddHorasAutonomasToContenido < ActiveRecord::Migration
  def change
    add_column :contenidos, :horas_autonomas, :integer
  end
end
