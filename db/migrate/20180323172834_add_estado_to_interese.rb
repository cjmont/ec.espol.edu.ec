class AddEstadoToInterese < ActiveRecord::Migration
  def change
    add_reference :intereses, :estado, index: true, foreign_key: true
  end
end
