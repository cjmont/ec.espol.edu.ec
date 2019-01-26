class AddImagenToProspectos < ActiveRecord::Migration
  def change
    add_column :prospectos, :imagen, :string
  end
end
