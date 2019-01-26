class AddCamposToContenidos < ActiveRecord::Migration
  def change
    add_column :contenidos, :justificacion, :text
    add_column :contenidos, :metodologia, :text
  end
end
