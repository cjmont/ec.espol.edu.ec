class AddProspectoToInteres < ActiveRecord::Migration
  def change
  	add_reference :intereses, :prospectos, index: true
  end
end
