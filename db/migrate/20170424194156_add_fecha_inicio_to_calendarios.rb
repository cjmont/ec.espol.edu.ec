class AddFechaInicioToCalendarios < ActiveRecord::Migration
  def change
    add_column :calendarios, :fecha_inicio, :datetime
  end
end
