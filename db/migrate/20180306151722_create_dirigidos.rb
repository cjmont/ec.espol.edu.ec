class CreateDirigidos < ActiveRecord::Migration
	def change
		create_table :dirigidos do |t|
			t.string :texto
			t.string :tipo
			t.references :contenido, index: true
			t.timestamps null: false
		end
	end
end
