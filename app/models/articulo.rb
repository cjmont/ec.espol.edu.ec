class Articulo < ActiveRecord::Base

	belongs_to :noticia

	has_attached_file :imagen, styles: { medium: "730x730>", thumb: "100x100>" }
	#do_not_validate_attachment_file_type :image
  	validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\z/


	#OBTENER EL ULTIMO ARTICULO DE UNA NOTICIA
	def self.buscar_articulo(tipo)

		@articulo = Noticia.select("id, publicacion").where("tipo like ?",tipo).order("publicacion").last
	  	@publicacion = @articulo.publicacion
	  	where("noticia_id like ?", @articulo.id).last
	end

	#OBTENER FECHA DEL ULTIMO ARTICULO DE UNA NOTICIA
	def self.buscar_publicacion()
		@publicacion
	end

end
