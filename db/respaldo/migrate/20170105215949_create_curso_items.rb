class CreateCursoItems < ActiveRecord::Migration
  def change
    create_table :curso_items do |t|
      t.references :curso, index: true, foreign_key: true
      t.belongs_to :registro, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
