class AddAttachmentImagenToProspectos < ActiveRecord::Migration
  def self.up
    change_table :prospectos do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :prospectos, :imagen
  end
end
