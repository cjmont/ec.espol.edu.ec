ActiveAdmin.register Evento do

  menu priority: 7
  
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	permit_params :fecha_inicio,  :contenido_id
 

 	index do
    	selectable_column
    	id_column
    	column :fecha_inicio, as: :date_time_picker
    	column :contenido
    	actions
  	end

   filter :fecha_inicio
   filter :contenido_id
 
 	form do |f|
	  	f.inputs "Contenido" do
		    f.input :fecha_inicio
		    f.input :contenido_id, :as => :select, :collection => Contenido.all.map{ |contenidos| [Prospecto.find(contenidos.prospecto_id).nombre, contenidos.id]}
		end
		f.actions
	end
end
