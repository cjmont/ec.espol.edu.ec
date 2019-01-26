class AddAttachmentImagenToAreas < ActiveRecord::Migration
  def self.up
    change_table :areas do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :areas, :imagen
  end

end
