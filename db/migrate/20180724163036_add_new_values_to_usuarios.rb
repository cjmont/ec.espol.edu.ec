class AddNewValuesToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :empresa_labora, :text
    add_column :usuarios, :cargo, :text
  end
end
