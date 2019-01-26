class CreateEspecialidads < ActiveRecord::Migration
  def change
    create_table :especialidads do |t|
      t.integer :codigo_SETEC
      t.string :especialidad
      t.references :area, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
