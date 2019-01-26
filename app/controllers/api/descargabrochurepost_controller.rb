class Api::DescargabrochurepostController < ApplicationController

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
		interes = Interese.all
		intereses = interes.map do |inter|
			usuario = Usuario.where(id: inter.usuario_id)
			if usuario.length != 0 then
				usuarios = usuario.map do |user|
					prospecto = Prospecto.where(id: inter.prospecto_id)
					{
			     		:id_usuario => user.id,
			     		:nombres => user.nombres,
			     		:apellidos => user.apellidos,
						:tipo_id => user.tipo_id,
						:identificacion => user.identificacion,
						:empresa => user.empresa,
						:movil => user.movil,
						:telefono => user.telefono,
						:telefono_emp => user.telefono_emp,
						:email => user.email,
						:cargo => user.cargo,
						:prospecto_id => prospecto[0].id,
						:prospecto_nombre => prospecto[0].nombre
		     		}
		     	end
		     end
		    {
		    	:interes_id => inter.id,
		    	:estado => inter.estado_id,
		    	:interesado => usuarios[0]
		    }
		end
	    return render json: {registrados: intereses}.to_json, status: :ok
    end
 
	def create #metodo post

		array = Array.new()
		for i in usuario_params #almacena los datos ingresados en un array
			array << i
		end
		descarga = 0
		interes = Interese.new
		prospecto =Prospecto.find_by(nombre: array[20][1])
		usuario = Usuario.find_by(identificacion: array[3][1], email: array[16][1])
		part = Participante.new
		if usuario == nil #verifica que el usuario no se encuentre en la base
			#se procede a ingresar al usuario
			@user = Usuario.new
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

			if array[3][1].length <=1 || array[16][1].length <=1
				return render :status => "400", :json => {:message => "Es obligatorio ingresar la cedula y el email"}.to_json
			end
			if array[21][1]=="true" #si es true entonces se lo registra al evento
				usuario = Usuario.find_by(identificacion: @user.identificacion) #se busca al usuario previamente ingresado
				evento = Evento.find(array[22][1]) #se busca el evento en la base para confirmar su existencia
				prospecto = Prospecto.find_by(nombre: array[20][1])
				participante = Participante.find_by(usuario_id: usuario.id, evento: evento.id)# se busca en la tabla participante usando el id del usuario y el id del evento
				if not participante #si no se encuentra registrado en el evento se lo registra
					part.usuario_id = usuario.id
					part.evento_id = evento.id
					if part.save
						descarga =1
					end
				end
	    	else
	    		render :status => "200", :json => {:status => "Usuario creado"}.to_json
	    	end
	    else
			participante = Participante.find_by(usuario_id: usuario.id)
			if participante != nil #verifica que se encuentre registrado en el evento
				descarga =1
			else
				#se lo registra en el evento si no se encuentra
				evento = Evento.find(array[22][1]) #se busca el evento en la base para confirmar su existencia
				part.usuario_id =usuario.id
				part.evento_id = evento.id
				if part.save
					descarga =1
				end
			end
		end
		
		if descarga !=1
			#se procede a llenar el objeto interes
			interes.usuario_id = usuario.id
			interes.prospecto_id = prospecto.id
			interes.area_id = prospecto.area_id
			#verifica que el usuario y el prospecto no se encuentren ya asociados en la entidad intereses
			if !Interese.find_by(usuario_id: interes.usuario_id, prospecto_id: interes.prospecto_id)
				if interes.save #ingresa el interes
					#envía el brochure al email del usuario y muestra el mensaje de envío exitoso
					contenido = Contenido.find_by(prospecto: prospecto.id)
					mail = ContenidoMailer.confirmacionDescargaContenido_email(usuario, prospecto, contenido)
					mail.deliver_now
					return render :status => "200", :json => {:message => "Se ha enviado su brochure. Por favor revise su Correo"}
				else
					return render :status => "400", :json => {:message => "No se pudo agregar el interes"}.to_json
				end
			else
				#actualizo la fecha en caso se encuentre el usuario y el prospecto en la base
				fecha = DateTime.now
				if !Interese.find_by(usuario_id: interes.usuario_id, prospecto_id: interes.prospecto_id).update_attributes(:updated_at => fecha)
					#en caso no se pueda actualizar
					return render :status => "400", :json => {:message => "No se pudo actualizar el interes"}
				else
					#si logra actualizar envía el brochure
					contenido = Contenido.find_by(prospecto: prospecto.id)
					mail = ContenidoMailer.confirmacionDescargaContenido_email(usuario, prospecto, contenido)
					mail.deliver_now
					#return mensaje = toastr.success('Interes actualizado y borchure enviado')
					return render :status => "200", :json => {:message => "Se ha enviado su brochure. Por favor revise su Correo"}
				end
			end
		end
	end

private
	def usuario_params
		params.require(:descargabrochurepost).permit(:nombres, :apellidos, :tipo_id, :identificacion, :fecha_nac, :ciudad, :sexo, :domicilio, :nivel_academico, :titulo, :institucion_proce, :profesion, :empresa, :movil, :telefono, :telefono_emp, :email, :nivel_ingreso, :password, :cargo, :prospecto_id, :registro_participante, :evento)
	end
end