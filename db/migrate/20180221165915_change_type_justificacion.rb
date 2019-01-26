class ChangeTypeJustificacion < ActiveRecord::Migration
  def up
    change_table :contenidos do |t|
      t.change :justificacion, :string
      t.change :metodologia, :string
    end
  end

  def down
    change_table :contenidos do |t|
      t.change :justificacion, :text
      t.change :metodologia, :text
    end
  end
end