module CurrentLista

	private 

	def set_lista
		@lista = Lista.find(session[:lista_id])
	rescue ActiveRecord::RecordNotFound
		@lista = Lista.create
		session[:lista_id] = @lista.id
	end
end