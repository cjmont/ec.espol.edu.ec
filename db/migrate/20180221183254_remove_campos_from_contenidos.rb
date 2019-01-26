class RemoveCamposFromContenidos < ActiveRecord::Migration
  def change
    remove_column :contenidos, :justificacion, :text
    remove_column :contenidos, :metodologia, :text
  end
end
