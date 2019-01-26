
		class ProspectoController < ApplicationController
			def index
				@programas = Prospecto.buscar_programas(params[:searchTxt])
				@cursos = Prospecto.buscar_cursos(params[:searchTxt])
				@conferencias = Prospecto.buscar_conferencias(params[:searchTxt])
				@banner = view_context.image_path 'Prospectos/curso.jpg'
				@error = nil
				if @programas.blank? and @cursos.blank? and @conferencias.blank? then
					@error = "No se ha encontrado ningun resultado con '#{params[:searchTxt]}'"
				end
			end
			def prospectoEspecifico
				if params[:tipo] == "Programas"
					@prospectos = Prospecto.get_programas().order( id: :desc).page(params[:page]).per(9)

					@tipo = "PROGRAMAS" 
					@banner = view_context.image_path 'Prospectos/curso.jpg'
				elsif  params[:tipo] == "Cursos"
					@prospectos = Prospecto.get_cursos().order( id: :desc).page(params[:page]).per(9)
					@tipo = "CURSOS" 
					@banner = view_context.image_path 'Prospectos/curso.jpg'
				elsif  params[:tipo] == "Conferencias"
					@prospectos = Prospecto.get_conferencias().order( id: :desc).page(params[:page]).per(9)
					@tipo = "CONFERENCIAS" 
				elsif params[:tipo] == "Diplomado"
					@tipo = "DIPLOMADO" 
					@banner = view_context.image_path 'Prospectos/curso.jpg'
					@prospectos = Prospecto.get_diplomado().order( id: :desc).page(params[:page]).per(9)
				else 
					@prospectos = nil
					@tipo = "Error" 
				end

			end
			def corporativo 
			end

			def api
				@prospecto = Prospecto.all
			end

			
		end
	