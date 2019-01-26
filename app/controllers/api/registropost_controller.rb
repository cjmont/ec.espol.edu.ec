class Api::RegistropostController < ApplicationController

skip_before_filter :verify_authenticity_token, if: :json_request?

	def json_request?
		request.format.json?
	end
	def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
	def index #metodo get
        usuario = Usuario.all
		usuarios = usuario.map do |user|
			participante = Participante.where( usuario_id: user.id)#busco los participantes con el mismo id
			if participante.length != 0 then
	     		eventos = participante.map do |part|
	     			{
			     		:evento => part.evento_id #listo los eventos en los que es encuentra registrado el participante
		     		}
	    		end
	    	end
    		{
	     		:id => user.id,
	     		:nombres => user.nombres,
	     		:apellidos => user.apellidos,
				:tipo_id => user.tipo_id,
				:identificacion => user.identificacion,
				:fecha_nac => user.fecha_nac,
				:ciudad => user.ciudad,
				:sexo => user.sexo,
				:domicilio => user.domicilio,
				:nivel_academico => user.nivel_academico,
				:titulo => user.titulo,
				:institucion_proce => user.institucion_proce,
				:profesion => user.profesion,
				:empresa => user.empresa,
				:movil => user.movil,
				:telefono => user.telefono,
				:telefono_emp => user.telefono_emp,
				:email => user.email,
				:nivel_ingreso => user.nivel_ingreso,
				:password => user.password,
				:cargo => user.cargo,
				:eventos => eventos
     		}
	    end
	    return render json: {registrados: usuarios}.to_json, status: :ok
    end
 
	def create #metodo post
		array = Array.new()
		for i in usuario_params #almacena los datos ingresados en un array
			array << i
		end
		@user = Usuario.new
		usuario = Usuario.new
		part = Participante.new
		#se procede a llenar el usuario con los respectivos valores
		@user.nombres = array[0][1].titleize
		@user.apellidos = array[1][1].titleize
		@user.tipo_id = array[2][1]
		@user.identificacion = array[3][1]
		@user.fecha_nac = array[4][1]
		@user.ciudad = array[5][1].titleize
		@user.sexo = array[6][1]
		@user.domicilio = array[7][1]
		@user.nivel_academico = array[8][1]
		@user.titulo = array[9][1]
		@user.institucion_proce = array[10][1]
		@user.profesion = array[11][1]
		@user.empresa = array[12][1]
		@user.movil = array[13][1]
		@user.telefono = array[14][1]
		@user.telefono_emp = array[15][1]
		@user.email = array[16][1]
		@user.nivel_ingreso = array[17][1]
		@user.password = array[18][1]
		@user.cargo = array[19][1]

		#0: el usuario ya existe   1: se ingresó un nuevo usuario	2: no se ingresó el usuario
		estado = 0 
		
		#valida que los campos email y cédula no vengan vacíos, no valida la estructura de los mismos
		if array[3][1].length <=1 || array[16][1].length <=1
			return render :status => "400", :json => {:message => "Es obligatorio ingresar la cedula y el email"}.to_json
		end

		if !Usuario.find_by(identificacion: array[3][1]) #verifica que el usuario no exista antes de ingresarlo a la base
			if @user.save #ingresa al usuario a la base
				estado =1
			else
				estado =2
	    	end
		end

		if estado != 2 #si es distinto de 2 significa que el usuario ya está ingresado y se procede a registrarlo al evento
			if array[21][1]=="true" #si es true entonces se lo registra al evento
				usuario = Usuario.find_by(identificacion: @user.identificacion) #se busca al usuario previamente ingresado
				evento = Evento.find(array[22][1]) #se busca el evento en la base para confirmar su existencia
				prospecto = Prospecto.find_by(nombre: array[20][1])
				# se busca en la tabla participante usando el id del usuario y el id del evento
				participante = Participante.find_by(usuario_id: usuario.id, evento: evento.id)
				if not participante #si no se encuentra registrado en el evento se lo registra
					part.usuario_id = usuario.id
					part.evento_id = evento.id
					if part.save
						render :status => "200", :json => {:message => "Participante registrado exitosamente"}.to_json
					end
				else
					render :status => "400", :json => {:message => "Participante ya se encuentra registrado"}.to_json
				end
	    	else
	    		array[21][1]=="false"
	    		interes = Interese.new
	    		usuario = Usuario.find_by(identificacion: array[3][1], email: array[16][1])
	    		prospecto = Prospecto.find_by(nombre: array[20][1])
	    		interes.usuario_id = usuario.id
	    		interes.prospecto_id = prospecto.id
			   
			    interes.save
			    usuario.save

	    		render :status => "200", :json => {:message => "Registro Exitoso!"}.to_json	
	    	end
	    else
	    	render :status => "400", :json => {:message => "No se pudo ingresar el usuario"}.to_json
	    end
	end

private
	def usuario_params
		params.require(:registropost).permit(:nombres, :apellidos, :tipo_id, :identificacion, :fecha_nac, :ciudad, :sexo, :domicilio, :nivel_academico, :titulo, :institucion_proce, :profesion, :empresa, :movil, :telefono, :telefono_emp, :email, :nivel_ingreso, :password, :cargo, :prospecto_id, :registro_participante, :evento)
	end
end