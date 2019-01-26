class AddFechaFinToCalendario < ActiveRecord::Migration
  def change
    add_column :calendarios, :fecha_fin, :datetime
  end
end
