class Api::NoticiaController < ApplicationController


def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
    
	include ActionController::ImplicitRender
	def index
	    noticia = Noticia.all
	    listanoticia = noticia.map do |noti|
	     	articulo = Articulo.where( noticia_id: noti.id)
	     	if articulo.length != 0 then
	     		articles = articulo.map do |artic|
	     			{
		     		:titulo => artic.titulo,
		     		:escritor => artic.escritor,
		     		:contenido => artic.contenido,
		     		:imagen => artic.imagen
		     		}
	     		end
	     	end
	     	{
		    :id => noti.id,
		    :tipo => noti.tipo,
		    :edicion => noti.edicion,
		    :publicacion => noti.publicacion,
		    :redactor => noti.redactor,
		    :articulos => articles
		    }
	     end

	     return render json: {noticias: listanoticia}.to_json, status: :ok
	  end

private
	def getestado(id_estado)
		estados = Estado.find(id_estado)
		return estados.estado
	end
end
