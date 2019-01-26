class CreateContenidos < ActiveRecord::Migration
  def change
    create_table :contenidos do |t|
      t.string :modalidad
      t.string :certificado
      t.string :justificacion
      t.string :objetivo
      t.integer :credito
      t.string :requisito_instructor
      t.string :metodologia
      t.integer :version
      t.string :objetivo_especifico
      t.references :prospecto, index: true, foreign_key: true
      t.references :especialidad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
