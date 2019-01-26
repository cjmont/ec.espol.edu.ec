class CreateProspectos < ActiveRecord::Migration
  def change
    create_table :prospectos do |t|
      t.text :nombre
      t.string :linea_negocio
      t.string :tipo
      t.references :estado, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
