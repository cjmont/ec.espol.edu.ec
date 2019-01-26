class PedidosController < ApplicationController

    include CurrentLista
  before_action :set_lista, only: [:new, :create]
  before_action :set_pedido, only: [:show, :edit, :destroy]
  
  def index
	  @pedidos = Pedido.all 
	  
	end
	
	def new

		if @lista.item_calendarios.empty?
			redirect_to root_url, notice: 'Tu Registro esta VACIO'

			return
		end
		@pedido = Pedido.new
	
	end
	
	def create
		@pedido = Pedido.new(pedido_params)
		@pedido.add_item_calendarios_from_lista(@lista)
		if @pedido.save
			Lista.destroy(session[:lista_id])
			session[:lista_id] = nil
			OrderNotifier.received(@pedido).deliver 
			redirect_to root_url, notice: 'Gracias por tu Inscripción!'
		else
		  render :new, notice: 'Por favor revisa tu Formulario'
		end 
	end
	
	def show

	 
	end
	
	def destroy
		@pedido.destroy
		redirect_to root_url, notice: 'Incripcion Eliminada'
	end
	
	private
	
	def set_pedido
		@pedido = Pedido.find(params[:id])
	end
	
	def pedido_params
		params.require(:pedido).permit(:nombre, :email, :direccion,:telefono, :ciudad, :pais)
	end
  	
end

