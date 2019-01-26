class CreateItemCalendarios < ActiveRecord::Migration
  def change
    create_table :item_calendarios do |t|
      t.references :calendario, index: true, foreign_key: true
      t.belongs_to :lista
      t.integer :cantidad, default: 1
      t.timestamps null: false
    end
  end
end
