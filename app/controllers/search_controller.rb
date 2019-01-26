class SearchController < ApplicationController
	def index
		prospecto = Prospecto.find(1)
		render json: {prospecto: prospecto},status: :ok
	end
	def show 
		id = "%#{params[:id]}%"

		prospectos = Prospecto.where( "nombre LIKE ?", id)
		render json: {prospectos: prospectos},status: :ok
	end
end