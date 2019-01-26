class RemoveInitialValuesFromUsuarios < ActiveRecord::Migration
  def change
    remove_column :usuarios, :empresa_labora, :string
  end
end
