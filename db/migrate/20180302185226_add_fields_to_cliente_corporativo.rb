class AddFieldsToClienteCorporativo < ActiveRecord::Migration
  def change
  	add_column :cliente_corporativos, :empresa, :string
  	add_column :cliente_corporativos, :nombres, :string
  	add_column :cliente_corporativos, :apellidos, :string
  	add_column :cliente_corporativos, :email, :string
  	add_column :cliente_corporativos, :celular, :string
  	add_column :cliente_corporativos, :cargo, :string
  	add_column :cliente_corporativos, :fecha, :date
  	add_column :cliente_corporativos, :dias, :string
  	add_column :cliente_corporativos, :horaInicio, :time
  	add_column :cliente_corporativos, :horaFin, :time
  	add_column :cliente_corporativos, :participantes, :integer
  	add_column :cliente_corporativos, :lugar, :string
  	add_column :cliente_corporativos, :problema, :text
  end
end
