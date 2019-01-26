class RenameCreditoToContenidos < ActiveRecord::Migration
 def change
    rename_column :contenidos, :credito, :horas_presenciales
 end
end
