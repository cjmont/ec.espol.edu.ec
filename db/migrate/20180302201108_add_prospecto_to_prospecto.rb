class AddProspectoToProspecto < ActiveRecord::Migration
  def change
  	add_reference :prospectos, :prospectos, index: true
  end
end
