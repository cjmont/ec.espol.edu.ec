class AddObservacionToIntereses < ActiveRecord::Migration
  def change
    add_column :intereses, :observacion, :text
  end
end
