class AddNewSectorToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :sector, :string
  end
end
