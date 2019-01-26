class AddPerfilParticipanteToContenidos < ActiveRecord::Migration
  def change
    add_column :contenidos, :perfil_participante_recomendable, :string
    add_column :contenidos, :perfil_participante_indispensables, :string
  end
end
