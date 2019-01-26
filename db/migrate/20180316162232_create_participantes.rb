class CreateParticipantes < ActiveRecord::Migration
  def change
    create_table :participantes do |t|
    	t.references :usuario, index: true
    	t.references :evento, index: true
    	t.timestamps null: false
    end
  end
end
