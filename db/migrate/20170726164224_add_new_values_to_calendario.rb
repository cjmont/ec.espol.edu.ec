class AddNewValuesToCalendario < ActiveRecord::Migration
  def change
    add_column :calendarios, :horario, :text
    add_column :calendarios, :sede, :string
  end
end
