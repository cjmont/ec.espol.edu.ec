ActiveAdmin.register Contenido do

menu parent: "Prospectos", label: "Contenido", priority: 2

	permit_params :prospecto_id, :modalidad, :certificado, :justificacion, :objetivo , 
	:horas_presenciales, :horas_autonomas, :horas_virtuales, :descripcion, :metodologia, :version, 
	:objetivo_especifico, :precio, :descripcion


index do
	    selectable_column
	    id_column
	    column :prospecto
	    column :descripcion
	    column :modalidad
	    column :certificado
	    column :horas_presenciales
	    column :horas_autonomas
	    column :horas_virtuales
	    column :objetivo
	    column :precio
	    column :version
	    actions
	  end
	  
		filter :id
		filter :prospecto_id, :label => 'PROSPECTO ID'
		filter :prospecto, :collection => Prospecto.all.map{ |prospectos| [prospectos.nombre, prospectos.id]}
		filter :modalidad, :as => :select, :collection => ["Presencial", "Semipresencial", "Virtual"]
		filter :certificado, :as => :select, :collection => ["Aprobación","Participación"]
		filter :horas_presenciales
		filter :horas_autonomas
		filter :horas_virtuales
		filter :precio
		filter :version

	 form do |f|
	  f.inputs "Contenido" do
	  	f.input :prospecto_id, :as => :select, :collection => Prospecto.all.map{ |prospectos| [prospectos.nombre, prospectos.id]}
	  	f.input :descripcion
	    f.input :modalidad, :as => :select, :collection => ["Presencial", "Semipresencial", "Virtual"]
	    f.input :certificado, :as => :select, :collection => ["Aprobación","Participación"]
	    f.input :horas_presenciales
	    f.input :horas_autonomas
	    f.input :horas_virtuales
	    f.input :justificacion
	    f.input :objetivo
	    f.input :objetivo_especifico, :as => :ckeditor, :input_html => { ckeditor: {:uiColor => "#AADC6E", :toolbar =>  [
    { name: 'paragraph', items: [ 'BulletedList'] } ] }}
	    f.input :metodologia
	    f.input :precio 
	    f.input :version
	    
	 	end
		f.actions
		end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


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

end
