class AddNombreDeCursoToRegistroCorporativo < ActiveRecord::Migration
  def change
    add_column :cliente_corporativos, :nombre_curso, :string
  end
end
