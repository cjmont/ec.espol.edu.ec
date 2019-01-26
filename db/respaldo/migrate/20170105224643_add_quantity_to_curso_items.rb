class AddQuantityToCursoItems < ActiveRecord::Migration
  def change
    add_column :curso_items, :quantity, :integer, default: 1
  end
end
