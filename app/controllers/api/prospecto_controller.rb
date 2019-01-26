class Api::ProspectoController < ApplicationController

def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
end
    
	include ActionController::ImplicitRender

	# GET /prospecto/
	def index
	     prospecto = Prospecto.where(estado_id: 2)
	     listaprospecto = prospecto.map do |prosp|
	     	area = Area.find(prosp.area_id)
	     	contenidos = Contenido.find_by(prospecto_id: prosp.id) #, estado_id: 2
	     	dirigido = Dirigido.where(contenido_id: contenidos.id)
	     	if dirigido.length != 0 then
	     		dirigidoss = dirigido.map do |dirig|
	     			{
		     		:dirigido_id => dirig.id,
		     		:texto => dirig.texto,
		     		:tipo => dirig.tipo,
		     		:contenido_id => dirig.contenido_id
		     		}
	     		end
	     	end
	     	perfilPersona = PerfilPersonas.where( contenido_id: contenidos.id)
	     	if perfilPersona.length != 0 then
	     		perfils = perfilPersona.map do |perfil|
	     			{
			     		:id => perfil.id,
			     		:texto => perfil.texto,
			     		:tipo => perfil.tipo,
						:tipo_requisito => perfil.tipo_requisito,
						:contenido_id => perfil.contenido_id,
						:tipo_persona => perfil.tipo_persona
		     		}
	     		end
	     	end
	     	nivel = Nivel.where( contenido_id: contenidos.id)
	     	if nivel.length != 0 then
	     		level = nivel.map do |lev|
	     			{
			     		:id => lev.id,
			     		:unidad => lev.unidad,
						:credito => lev.credito,
						:nombre => lev.nombre, 
						:nivel_id => lev.nivel_id,
						:contenido_id =>lev.contenido_id
		     		}
	     		end
	     	end
	     	evento = Evento.where( contenido_id: contenidos.id)
	     	if evento.length != 0 then
	     		listaEvento =Array.new
	     		listaEvento << evento[0]
	     		eventos = listaEvento.map do |event|
	     		{
	     			:fecha_inicio => event.fecha_inicio
	     		}
	     		end
	     	end
	     	{
		     :id => prosp.id,
		     :nombre => prosp.nombre,
		     :linea_negocio => prosp.linea_negocio,
		     :tipo => prosp.tipo,
		     :area => {
			     	:nombre => area.nombre,
			     	:nombre_corto => area.nombre_corto,
			     	:imagen => area.imagen,
			     	:imagen_file_name => area.imagen_file_name,
			     	:sector => area.sector
		     	},
		     :imagen => prosp.imagen,
		     :estado => getestado(prosp.estado_id),
		     :imagen_file_name => prosp.imagen_file_name,
		     :curso => prosp.curso,
		     :fecha_inicio => eventos,
		     :contenido => {
		     	:idContenido => contenidos.id,
		     	:idProspecto => contenidos.prospecto_id,
		     	:modalidad => contenidos.modalidad,
		     	:certificado => contenidos.certificado,
		     	:objetivo => contenidos.objetivo,
		     	:objetivo_especifico => contenidos.objetivo_especifico,
		     	:justificacion => contenidos.justificacion,
		     	:metodologia => contenidos.metodologia,
		     	:descripcion => contenidos.descripcion,
		     	:horas_presenciales => contenidos.horas_presenciales,
		     	:horas_virtuales => contenidos.horas_virtuales,
		     	:horas_autonomas => contenidos.horas_autonomas,
		     	:version => contenidos.version,
		     	:precio => contenidos.precio,
		     	:dirigido => dirigidoss,
		     	:nivel => level,
		     	:perfil => perfils
		     }
		    }
	     end
	     return render json: {prospectos: listaprospecto}.to_json, status: :ok
	end

	# GET /prospecto/:id
	def show
			prospecto = Prospecto.where(id: params[:id])
	     	listaprospecto = prospecto.map do |prosp|
	     	area = Area.find(prosp.area_id)
	     	contenidos = Contenido.find_by(prospecto_id: prosp.id) #, estado_id: 2
	     	dirigido = Dirigido.where(contenido_id: contenidos.id)

	     	if dirigido.length != 0 then
	     		dirigidoss = dirigido.map do |dirig|
	     			{
		     		:dirigido_id => dirig.id,
		     		:texto => dirig.texto,
		     		:tipo => dirig.tipo,
		     		:contenido_id => dirig.contenido_id
		     		}
	     		end
	     	end

	     	perfilPersona = PerfilPersonas.where( contenido_id: contenidos.id)

	     	if perfilPersona.length != 0 then
	     		perfils = perfilPersona.map do |perfil|
	     			{
			     		:id => perfil.id,
			     		:texto => perfil.texto,
			     		:tipo => perfil.tipo,
						:tipo_requisito => perfil.tipo_requisito,
						:contenido_id => perfil.contenido_id,
						:tipo_persona => perfil.tipo_persona
		     		}
	     		end
	     	end

	     	nivel = Nivel.where( contenido_id: contenidos.id)

	     	if nivel.length != 0 then
	     		level = nivel.map do |lev|
	     			{
			     		:id => lev.id,
			     		:unidad => lev.unidad,
						:credito => lev.credito,
						:nombre => lev.nombre, 
						:nivel_id => lev.nivel_id,
						:contenido_id =>lev.contenido_id
		     		}
	     		end
	     	end

	     	evento = Evento.where( contenido_id: contenidos.id)

	     	if evento.length != 0 then
	     		listaEvento =Array.new
	     		listaEvento << evento[0]
	     		eventos = listaEvento.map do |event|
	     		{
	     			:fecha_inicio => event.fecha_inicio
	     		}
	     		end
	     	end

	     	{
		     :id => prosp.id,
		     :nombre => prosp.nombre,
		     :linea_negocio => prosp.linea_negocio,
		     :tipo => prosp.tipo,
		     :area => {
			     	:nombre => area.nombre,
			     	:nombre_corto => area.nombre_corto,
			     	:imagen => area.imagen,
			     	:imagen_file_name => area.imagen_file_name,
			     	:sector => area.sector
		     	},
		     :imagen => prosp.imagen,
		     :estado => getestado(prosp.estado_id),
		     :imagen_file_name => prosp.imagen_file_name,
		     :curso => prosp.curso,
		     :fecha_inicio => eventos,
		     :contenido => {
		     	:idContenido => contenidos.id,
		     	:idProspecto => contenidos.prospecto_id,
		     	:modalidad => contenidos.modalidad,
		     	:certificado => contenidos.certificado,
		     	:objetivo => contenidos.objetivo,
		     	:objetivo_especifico => contenidos.objetivo_especifico,
		     	:justificacion => contenidos.justificacion,
		     	:metodologia => contenidos.metodologia,
		     	:descripcion => contenidos.descripcion,
		     	:horas_presenciales => contenidos.horas_presenciales,
		     	:horas_virtuales => contenidos.horas_virtuales,
		     	:horas_autonomas => contenidos.horas_autonomas,
		     	:version => contenidos.version,
		     	:precio => contenidos.precio,
		     	:dirigido => dirigidoss,
		     	:nivel => level,
		     	:perfil => perfils
		     }
		    }
	     end

	     return render json: {prospectos: listaprospecto}.to_json, status: :ok
	end

# GET /prospecto/lista_prospecto?tipo=[Programa / Curso / Diplomado / Charla]"
	def lista_prospecto
		prospectos = Prospecto.where("tipo = ? and estado_id = ?", params[:tipo], 2)

	     listaprospectos = prospectos.map do |prospecto|
	     	contenidos = Contenido.find_by(prospecto_id: prospecto.id) #, estado_id: 2
	    
	     	{
		     :id => prospecto.id,
		     :nombre => prospecto.nombre,
		     :imagen => prospecto.imagen,
		     :imagen_file_name => prospecto.imagen_file_name,
		     :contenido => {
		     	:descripcion => contenidos.descripcion,
		     	:version => contenidos.version,
		    	 }
			}
	     end

		return render json: {prospectos: listaprospectos}.to_json, status: :ok
	end

private
	def getestado(id_estado)
		estados = Estado.find(id_estado)
		return estados.estado
	end
end
