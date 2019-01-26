ActiveAdmin.register Participante do

	menu parent: "Registros", label: "Pre-Registrados"

	permit_params :evento_id, :usuario_id, :estado_id
	 
#  # Create sections on the index screen
#   scope :all, default: true

   scope :pendientes do |participante|

           participante.where(:estado_id => nil)

   end

   scope :contactados do |participante|

     estado_contactado = 4

           participante.where(:estado_id => estado_contactado)

   end

   scope :seguimiento do |participante|

     estado_seguimiento = 6

          participante.where(:estado_id => estado_seguimiento)

  end

   scope :registrados do |participante|

     estado_registrado = 5

          participante.where(:estado_id => estado_registrado)

   end


	 index do
	    selectable_column
	    id_column

	    column :evento
	    column :usuario

	    column "Nombres", :usuario_id do |usuario|
	      Usuario.find(usuario.usuario_id).nombres
	    end

	    column "Apellidos", :usuario_id do |usuario|
	      Usuario.find(usuario.usuario_id).apellidos
	    end

	    column "CI", :usuario_id do |usuario|
	      Usuario.find(usuario.usuario_id).identificacion
	    end

	    column "Movil", :usuario_id do |usuario|
	      Usuario.find(usuario.usuario_id).movil
	    end

	     column "Email", :usuario_id do |usuario|
	      Usuario.find(usuario.usuario_id).email
	    end

	    column "Ciudad", :usuario_id do |usuario|
	      Usuario.find(usuario.usuario_id).ciudad
	    end

	    column "Empresa", :usuario_id do |usuario|
	      Usuario.find(usuario.usuario_id).empresa
	    end

	    column "Cargo", :usuario_id do |usuario|
	      Usuario.find(usuario.usuario_id).cargo
	    end

	    column :estado
	    column :created_at
	    actions

	  end

	  csv do
	    column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).nombres }
	    column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).apellidos }
	    column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).identificacion }
	    column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).movil }
	    column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).email }
	    column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).ciudad }
	    column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).empresa }
	    column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).cargo }

	  end

	   filter :id
	   filter :created_at
	   #filter :evento, :collection => Evento.all.map{ |evento| [Prospecto.find(Contenido.find(evento.contenido_id).prospecto_id).nombre + " - Fecha: " + evento.fecha_inicio.strftime("%d %b %Y"), evento.id]}
	   filter :evento_id
	   filter :evento, :collection => Evento.all.map{ |evento| [Prospecto.find(Contenido.find(evento.contenido_id).prospecto_id).nombre + " - Fecha: " +  evento.fecha_inicio.strftime("%d %b %Y"), evento.id]}
	   filter :usuario_id
	   filter :estado, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}

	 form do |f|
	  f.inputs "Participante" do
        #f.input :evento_id
        #f.input :usuario_id
		f.input :estado, :as => :select, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}
	 end
	f.actions


	end

end
