class Pedido < ActiveRecord::Base
	has_many :item_calendarios, dependent: :destroy
	
	validates :nombre, :email, :direccion, :telefono, presence: true
	
	def add_item_calendarios_from_lista(lista)
		lista.item_calendarios.each do |item|
			item.lista_id = nil 
			item_calendarios << item
		end
	end
	
	def total_precio
	  item_calendarios.map(&:total_precio).sum
	end
end
