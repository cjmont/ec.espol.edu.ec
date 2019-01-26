class Lista < ActiveRecord::Base
	has_many :item_calendarios,  dependent:  :destroy

	def add_calendario(calendario_id)

		current_item = item_calendarios.find_by(calendario_id: calendario_id)

		if current_item

			
		else
			current_item = item_calendarios.build(calendario_id: calendario_id)
		end
	current_item
	end

	def total_precio
		item_calendarios.to_a.sum{ |item| item.total_precio }
	end
	def remove_calendario(calendario_id)
		current_item = item_calendarios.find_by(calendario_id: calendario_id)
		if current_item
			current_item.cantidad =current_item.cantidad-1
		else
			current_item = item_calendarios.build(calendario_id: calendario_id)
		end
	current_item
	end
end
