class ItemCalendario < ActiveRecord::Base
  belongs_to :calendario
  belongs_to :lista
  belongs_to :pedido
  


  def total_precio

  	if calendario.curso.nil?
  		if calendario.programa.nil?
  			0
  		else
  			calendario.programa.precio
  		end
	else
			calendario.curso.precio
	end
		
	end
end
