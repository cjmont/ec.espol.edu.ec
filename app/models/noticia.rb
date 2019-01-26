class Noticia < ActiveRecord::Base

	has_many :articulo

	#OBTENER LA ULTIMA NOTICIA
	def self.buscar_noticia(tipo)

		where("tipo like ?",tipo).order("publicacion").last
	end

end
