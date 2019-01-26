class CreatePerfilParticipantes < ActiveRecord::Migration
  def change
    create_table :perfil_participantes do |t|
    	t.string :texto
    	t.string :tipo
    	t.string :tipo_requisito
    	t.references :contenido, index: true
		t.timestamps null: false
    end
  end
end
