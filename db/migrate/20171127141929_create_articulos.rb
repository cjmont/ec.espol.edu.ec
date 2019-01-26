class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.string :escritor
      t.text :contenido
      t.string :imagen
      t.references :noticia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
