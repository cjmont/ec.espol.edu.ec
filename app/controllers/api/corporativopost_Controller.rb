class Api::CorporativopostController < ApplicationController

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
		@clientecorporativo = ClienteCorporativo.new
        @clientecorporativo = ClienteCorporativo.all
        render json: @clientecorporativo
    end
 
	def create
		@clientecorporativo = ClienteCorporativo.new(corporativo_params)	   	
	    if @clientecorporativo.save
	    	render :status => "200", :json => {:message => "Enviado"}.to_json
	    else
           render :status => "400", :json => {:status => "No se envio, revise el número de caracteres usados"}.to_json
		end
	end

private
	def corporativo_params
		params.require(:corporativopost).permit(:empresa, :nombres, :apellidos, :email, :celular, :cargo, :fecha, :dias, :horaInicio, :horaFin, :participantes, :lugar, :problema, :nombre_curso, :estado_id, :tipo_evento)
	end
end