class CreateNoticias < ActiveRecord::Migration
  def change
    create_table :noticias do |t|
      t.string :tipo
      t.integer :edicion
      t.date :publicacion
      t.string :redactor

      t.timestamps null: false
    end
  end
end
