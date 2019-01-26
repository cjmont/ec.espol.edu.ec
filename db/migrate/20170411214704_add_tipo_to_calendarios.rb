class AddTipoToCalendarios < ActiveRecord::Migration
  def change
    add_column :calendarios, :tipo, :string
  end
end
