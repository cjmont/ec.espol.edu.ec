ActiveAdmin.register Prospecto do

  menu parent: "Prospectos", label: "Prospecto", priority: 1


#menu priority: 2

#belongs_to :area, optional: true
#belongs_to :estado, optional: true
 
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :nombre, :curso, :linea_negocio, :tipo, :area_id, :imagen, :prospectos_id, :estado_id, :url_video

# Create sections on the index screen
  scope :all, default: true

  scope :edicion do |prospectos|

          prospectos.where(:estado_id => 7)

  end

  scope :activos do |prospectos|

    estado_publicado = 1

          prospectos.where(:estado_id => estado_publicado)

  end

  scope :publicados do |prospectos|

    estado_publicado = 2

          prospectos.where(:estado_id => estado_publicado)

  end

 index do
    selectable_column
    id_column
    column :nombre
    column :curso
    column :linea_negocio
    column :tipo
    column :area
    column :prospectos_id, :label => 'Programa'
    column :estado

    actions
  end



  filter :id
   filter :nombre
   filter :linea_negocio, :as => :select, :collection => ["Abierto", "Corporativo"]
   filter :tipo, :as => :select, :collection => ["Curso", "Programa","Diplomado", "Charla", "Webinario"]
   filter :area, :collection => Area.all.map{ |areas| [areas.nombre, areas.id]}
   filter :prospectos_id, :label => 'Programa'
   filter :estado, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}

 form do |f|
  f.inputs "Prospectos" do
    f.input :nombre
    f.input :curso
    f.input :linea_negocio, :as => :select, :collection => ["Abierto", "Corporativo"]
    f.input :tipo, :as => :select, :collection => ["Curso", "Programa","Diplomado", "Charla","Webinario"]
    f.input :area_id, :as => :select, :collection => Area.all.map{ |areas| [areas.nombre, areas.id]}
    f.input :prospectos_id, :as => :select, :collection => Prospecto.all.map{ |prospecto| [prospecto.nombre, prospecto.id]}, :label => 'Programa'
    f.input :imagen
    f.input :estado_id, :as => :select, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}
    f.input :url_video
 end
f.actions


end


end