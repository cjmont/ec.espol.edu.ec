class CreateCorporativos < ActiveRecord::Migration
  def change
    create_table :corporativos do |t|

      t.timestamps null: false
    end
  end
end
