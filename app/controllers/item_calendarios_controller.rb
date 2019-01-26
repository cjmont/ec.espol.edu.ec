class ItemCalendariosController < ApplicationController

  include CurrentLista
	before_action :set_lista, only: [:create]
	before_action :set_item_calendario, only: [:show, :destroy]

def create
	calendario = Calendario.find(params[:calendario_id])
	@item_calendario = @lista.add_calendario(calendario.id)
	if @item_calendario.save
		redirect_to root_url, notice: 'Curso(s) Agregado al registro de Inscripción'

	else

		render :new
	end
	
end

	private

	def set_item_calendarios
		@item_calendario = ItemCalendario.find(params[:calendario_id])

	end

def item_calendario_params
	params.require(:item_calendario).permit(:calendario_id)
end

end

