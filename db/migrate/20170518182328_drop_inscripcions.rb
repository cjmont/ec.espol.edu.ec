class DropInscripcions < ActiveRecord::Migration
  def up
    drop_table :inscripcions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
