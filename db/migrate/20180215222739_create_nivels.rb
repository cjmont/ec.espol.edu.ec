class CreateNivels < ActiveRecord::Migration
  def change
    create_table :nivels do |t|
    	t.integer :unidad
    	t.integer :credito
    	t.string :nombre
    	t.references :nivel, index: true, null: true
    	t.references :contenido, index: true
      t.timestamps null: false
    end
  end
end
