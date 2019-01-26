class RemoveRequisistosFromContenidos < ActiveRecord::Migration
  def change
    remove_column :contenidos, :dirigido_a, :text
    remove_column :contenidos, :perfil_participante_recomendable, :string
    remove_column :contenidos, :perfil_participante_indispensables, :string
  end
end
