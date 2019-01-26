class AddEstadoToParticipante < ActiveRecord::Migration
  def change
    add_reference :participantes, :estado, index: true, foreign_key: true
  end
end
