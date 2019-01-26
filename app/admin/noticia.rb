ActiveAdmin.register Noticia do

	menu parent: "Noticias", label: "Noticia", priority: 1

	permit_params :tipo, :edicion, :publicacion, :redactor
	 

	 index do
	    selectable_column
	    id_column
	    column :tipo
	    column :edicion
	    column :publicacion
	    column :redactor
	    actions
	  end

	   filter :tipo
	   filter :edicion
	   filter :publicacion
	   filter :redactor

	 form do |f|
	  f.inputs "Noticias" do

	    f.input :tipo, :as => :select, :collection => ["infoec","newsletter"]
	    f.input :edicion
	    f.input :publicacion
	    f.input :redactor, :as => :select, :collection => ["Diana Marchán R."]

	 end
	f.actions


	end
end
