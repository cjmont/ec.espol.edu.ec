class CorporativoController < ApplicationController
	def index
        @corporativo = Prospecto.buscar_Corporativo()
        @area = Area.all
        @arrayArea = Array.new
        @arrayCorp = Array.new
        @error = nil
        if @corporativo.blank? and @area.blank? then
            @error = "No se ha encontrado ningun resultado de Corporativo"
        else 
=begin 
SELECCION 3 SECTORES DIFERENTES Y CORPORATIVO EN SUS ARREGLOS RESPECTIVOS
           	@corporativo.each do |corporativo| 
                @area.each do |area|
                    if corporativo.area_id == area.id then
                        if @arrayArea.length == 0 then
                            @arrayArea.push area
                            @arrayCorp.push corporativo
                        elsif @arrayArea.length != 3 then
                            if verificar_sector(area.sector, @arrayArea) == false then
                                @arrayArea.push area
                                @arrayCorp.push corporativo
                            end
                        else
                            break
                        end
                    end 
                end
            end
=end
#GUARDA EN DOS ARREGLOS LOS CAMPOS DE AREA Y CORPORATIVO DE FORMA ALEATOREA
			@corporativo.each do |corporativo| 
                @area.each do |area|
                	if corporativo.area_id == area.id then
                		 if @arrayArea.length != 3 && @arrayCorp.length != 3 then
                		 	@arrayArea.push area
                            @arrayCorp.push corporativo
                         else
                         	break
                         end
                    end
                end
            end
        end
    end

	def registroCorporativo
	end
	def guardarRegistro
		cliente = ClienteCorporativo.new
		cliente.nombre_curso = params["nombre_curso"]
		cliente.empresa = params["empresa"]
		cliente.nombres = params["nombres"]
		cliente.apellidos = params["apellidos"]
		cliente.email = params["email"]
		cliente.celular = params["celular"]
		cliente.cargo = params["cargo"]
		cliente.fecha = params["fecha"]
		cliente.dias = params["dias"]
		cliente.horaInicio = params["horaInicio"]
		cliente.horaFin = params["horaFin"]
		cliente.participantes = params["participantes"]
        if verificar_lugar(params["lugar"]) then 
            cliente.lugar = params["direccion"]
        else
            cliente.lugar = params["lugar"]
        end
		cliente.problema = params["problema"]
		cliente.save()
		return redirect_to("/registroCorporativo")
	end

	private

	# PERMITE VALIDAR QUE NO SE REPITA UN SECTOR

	def verificar_sector(sector,array_area)
		array_area.each do |area|
			if area.sector == sector then
				return true
			end
		end
		return false
	end
    # PERMITE VALIDAR EL LUGAR CUANDO EL USUARIO HAYA SELECCIONADO LA OPCION DE "OTROS" O "Instalaciones de la empresa"
    def verificar_lugar(lugar)
        if lugar == "Instalaciones de la empresa" || lugar == "Otro"
            return true
        end
        return false
    end
end
