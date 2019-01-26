class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.references :contenido, index: true, foreign_key: true
      t.datetime :fecha_inicio

      t.timestamps null: false
    end
  end
end
