require "prawn"
class DetalleController < ApplicationController
	respond_to :js

	def index
	end

	def show
		str = params[:id].gsub("-"," ")
		if "NEC 2015".in? str
			if "AISC 2016".in? str
				str = str.gsub("NEC 2015","NEC-2015")
				str = str.gsub("AISC 2016","AISC-2016")
			end
		end
		@fecha_actual = DateTime.now
		@prospecto = Prospecto.find_by(nombre: str)
		if @prospecto == nil
			str = str+"?"
			@prospecto = Prospecto.find_by(nombre: str)
		end
		@contenido = Contenido.where(prospecto_id: @prospecto.id).take
		@dirigido = Dirigido.where(contenido_id: @contenido.id)
		
		# valida si el evento es webinario consulta que se pueda acceder desde cualquier hora del mismo dia
		if @prospecto.tipo == "Webinario"
			@fecha = Time.now
			yyyy = @fecha.year
			mm = @fecha.month
			dd = @fecha.day
			if dd <10
				dd = "0"+dd.to_s
			end
			if mm <10
				mm = "0"+mm.to_s
			end
			fecha = yyyy.to_s+"-"+mm.to_s+"-"+dd.to_s+" 00:00:00 -0500"
			@evento = Evento.eventos_planificados(@contenido, fecha).take
		else
			@evento = Evento.eventos_planificados(@contenido, @fecha_actual).take
		end
		@prospecto_id = str
		@guardado = cookies[:confirmacion]
		@estado = @prospecto.estado_id
		cookies.delete :confirmacion
	end

end
