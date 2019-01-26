class AddCursoToProspectos < ActiveRecord::Migration
  def change
    add_column :prospectos, :curso, :integer
  end
end
