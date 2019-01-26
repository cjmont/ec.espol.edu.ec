class CreateIntereses < ActiveRecord::Migration
  def change
    create_table :intereses do |t|
      t.references :usuario, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
