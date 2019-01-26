class AddOrderToCursoItems < ActiveRecord::Migration
  def change
    add_reference :curso_items, :order, index: true, foreign_key: true
  end
end
