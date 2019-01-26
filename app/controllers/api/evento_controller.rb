
class Api::EventoController < ApplicationController

def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
end
    
	include ActionController::ImplicitRender
	def index
		@fecha_actual = DateTime.now
	    evento = Evento.where("fecha_inicio >= ?", @fecha_actual).order("fecha_inicio asc")

	    listaEvento = evento.map do |event|
	     	contenido = Contenido.where( id: event.contenido_id)
	     	if contenido.length != 0 then
	     		listaContenido = contenido.map do |content|
	     			prospecto = Prospecto.where(id: content.prospecto_id)
		     		if prospecto.length != 0 then
		     			prospectos = prospecto.map do |prospect|
		     			# 	area = Area.where(id: prospect.area_id)
		     			# 	if area.length != 0 then
		     			# 		areas = area.map do |are|
		     			# 			{
		     			# 			:id => are.id,
		     			# 			:sector => are.sector
		     			# 			}
		     			# 		end
		     			# 	end
		     			{
		     			:id => prospect.id,
		     			:nombre => prospect.nombre,
		     			:tipo => prospect.tipo,
		     			:linea_de_negocio => prospect.linea_negocio,
		     			#:imagen => prospect.imagen,
		     			#:area => areas
		     			}
		     			end
		     		end
		     		# dirigido = Dirigido.where(contenido_id: content.id)
		     		# if  dirigido.length != 0 then
		     		# 	dirigidos = dirigido.map do |dirig|
		     		# 		{
		     		# 		:id => dirig.id,
		     		# 		:texto => dirig.texto
		     		# 		}
		     		# 	end
		     		#end
	     			{
	     			:id => content.id,
	     			#:estado => content.estado_id,
	     			# :objetivo => content.objetivo,
	     			# :descripcion => content.descripcion,
	     			# :metodologia => content.metodologia,
	     			# :dirigido => dirigidos,
		     		:prospecto => prospectos
		     		}
	     		end

	     	end
	     	{
		    :id => event.id,
		    :fecha => event.fecha_inicio,
		    :contenido => listaContenido
		    }
	    end
	    return render json: {eventos: listaEvento}.to_json, status: :ok
	end

private
	def getestado(id_estado)
		estados = Estado.find(id_estado)
		return estados.estado
	end
end