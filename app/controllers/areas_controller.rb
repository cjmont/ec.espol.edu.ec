class AreasController < ApplicationController
	def index
		areas = Area.all
		areasImg = Array.new
		areasNombre = Array.new
		areaId = Array.new
		areas.each do |a|
			areasImg.push('<img src="' + a.imagen.url + '"/>')
			areasNombre.push(a.nombre_corto)
			areaId.push(a.id)
		end
		render json: {imagen: areasImg,nombre_corto: areasNombre,areaId: areaId},status: :ok
	end
	def show 
	end

	def getProgramas
		prospecto = Prospecto.where(area_id: params[:id])
		prospectoImg = Array.new
		prospectoId = Array.new
		prospecto.each do |p|
			prospectoImg.push('<img src="' + p.imagen.url + '"/>')
			prospectoId.push(p.id)
		end
		render json: {imagen: prospectoImg,id: prospectoId},status: :ok
	end

	def getProspectos
		fecha_actual = DateTime.now
		pros = Array.new 

		#BUSCANDO PROSPECTOS PUBLICADOS QUE TENGAN FECHAS PROXIMAS
		prospectos_Array = Array.new
		areas = Area.where(sector: params[:sector])
		prospectos_Principales = Prospecto.where(area_id: areas).where(estado: 2) #ID DE ESTADO PUBLICADO 2
		contenidos_Principales = Contenido.where(prospecto: prospectos_Principales)
		eventos = Evento.where(contenido_id: contenidos_Principales).where("fecha_inicio >= ?", DateTime.now).order(:fecha_inicio)
		eventos.each do |evento| 
			if not prospectos_Array.include?(evento.contenido.prospecto) and prospectos_Array.size < 4
				prospectos_Array.push(evento.contenido.prospecto)
			end
		end

		#BUSCANDO PROSPECTOS PARA RELLENAR
		if prospectos_Array.size < 4
			prospectos_Relleno = Prospecto.where(area_id: areas).where(estado: 2) #ID DE ESTADO PUBLICADO 2
			prospectos_Relleno.each do |prospecto|
				if not prospectos_Array.include?(prospecto) and prospectos_Array.size < 4
					prospectos_Array.push(prospecto)
				end
				if prospectos_Array.size >= 4
					break
				end
			end 
		end

		#PREPARANDO RESPUESTA 
		prospectos_Array.each do |prospecto| 
				if pros.size < 4
					pros.push('<div class="sector-img-container">' + 
									'<a href="/detalle/' +  prospecto.nombre.gsub(" ","-") + '">' + 
										'<img class="sector-img" src="' + prospecto.imagen.url + '"/>' +
							        '</a>' + 
							  '</div>')
				else  
					break
				end
		end
		render json: {prospectos: pros},status: :ok
	end
end