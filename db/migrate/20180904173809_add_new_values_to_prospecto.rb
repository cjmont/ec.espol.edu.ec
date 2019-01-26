class AddNewValuesToProspecto < ActiveRecord::Migration
  def change
    add_column :prospectos, :url_video, :string
  end
end
