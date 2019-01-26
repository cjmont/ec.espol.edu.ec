ActiveAdmin.register Articulo do

	menu parent: "Noticias"

	permit_params :noticia, :titulo, :escritor, :contenido, :imagen
	 

	 index do
	    selectable_column
	    id_column

	    column :noticia
	    column :titulo
	    column :escritor
	    column :contenido
	    column :imagen
	    actions

	  end

	   filter :noticia_id
	   filter :titulo
	   filter :escritor
	   filter :contenido
	   filter :imagen

	 form do |f|
	  f.inputs "Articulo" do

	  	f.input :noticia, :collection => Noticia.all.map{ |noticias| [ noticias.tipo.to_s + " Edición N°" + noticias.edicion.to_s, noticias.id]}      

	    f.input :titulo
	    f.input :escritor
	    f.input :contenido
	    
	    #FORMATO DE IMAGENES: 275x183
	    f.input :imagen

	 end
	f.actions


	end

end
