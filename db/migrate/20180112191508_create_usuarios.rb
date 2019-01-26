class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombres
      t.string :apellidos
      t.string :tipo_id
      t.string :identificacion
      t.date :fecha_nac
      t.string :ciudad
      t.string :sexo
      t.string :domicilio
      t.string :nivel_academico
      t.string :titulo
      t.string :institucion_proce
      t.string :profesion
      t.string :empresa
      t.string :movil
      t.string :telefono
      t.string :telefono_emp
      t.string :email
      t.string :nivel_ingreso

      t.timestamps null: false
    end
  end
end
