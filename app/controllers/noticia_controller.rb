class NoticiaController < ApplicationController
	def noticia
		tipo = params[:tipo]
		@tipo_noticia = ""
		@error = nil
		if tipo == "infoec"
			@tipo_noticia = "INFO EC"
			@noticia = Noticia.buscar_noticia(tipo)

		elsif tipo== "newsletter"
			@tipo_noticia = "NEWSLETTER"
			@noticia = Noticia.buscar_noticia(tipo)
		else
			@error = "Se ha producido un error."
		end 

		@mes_actual = Time.now

	end
	def articulo 
		id = params[:id]
		@articulo = Articulo.find(id)
		@noticia = @articulo.noticia
		@tipo_noticia = ""
		if @noticia.tipo == "infoec"
			@tipo_noticia = "INFO EC"
		else 
			@tipo_noticia = "NEWSLETTER"
		end
	end
end
