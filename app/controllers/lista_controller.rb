class ListaController < ApplicationController

before_action :set_lista, only: [:show, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :invalid_lista
	
	def new 
		@lista = Lista.new
	end

	def show

	end

	def destroy
	@lista.destroy if @lista.id == session[:lista_id]
	session[:lista_id] = nil

	redirect_to root_url, notice:  'Su Registro está incompleto'

	end

	private

	def set_lista
		@lista = Lista.find(params[:id])

	end

	def lista_params	
		params[:lista]
	end

	def invalid_registro
		logger_error  'Su Inscripción es invalida'
		redirect_to root_url, notice: 'Inscripción Invalida'

		

	end
end

