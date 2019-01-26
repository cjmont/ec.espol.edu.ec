class AddEstadoToClienteCorporativo < ActiveRecord::Migration
  def change
    add_reference :cliente_corporativos, :estado, index: true, foreign_key: true
  end
end
