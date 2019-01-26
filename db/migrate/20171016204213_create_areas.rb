class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :nombre
      t.string :nombre_corto
      t.string :imagen

      t.timestamps null: false
    end
  end
end
