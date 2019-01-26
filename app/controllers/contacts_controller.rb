class ContactsController < ApplicationController
	

	include CurrentLista
	before_action :set_lista, only: [:index, :create]
	
	def index
		@contact = Contact.new
	end

	
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to root_url, notice: 'Gracias por tu comentario'
		else
		  render = 'new'
		end
	end
	
	private
	
	def contact_params
		params.require(:contact).permit(:nombre, :email, :telefono, :mensaje, :estado)
	end
	
end
