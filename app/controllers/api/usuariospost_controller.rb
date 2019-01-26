class Api::UsuariospostController < ApplicationController

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
	def index
		@contact = Contact.new
        @contact = Contact.all
        render json: @contact
    end
 
	
	def create

		flash = 'Gracias, un asesor de capacitacion se contactara con usted'
	    @contact = Contact.new(contact_params)
	    if @contact.save   
	     render :status => "200", :json => {:message => "Enviado"}.to_json
	    else    
           render :status => "400", :json => {:status => "No se envio, por que los datos estan duplicados"}.to_json
	    end
	    
	end

private
	
	def contact_params
		params.require(:usuariospost).permit(:nombre, :email, :telefono, :mensaje)
	end
	

    end