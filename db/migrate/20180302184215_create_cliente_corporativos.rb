class CreateClienteCorporativos < ActiveRecord::Migration
  def change
    create_table :cliente_corporativos do |t|

      t.timestamps null: false
    end
  end
end
