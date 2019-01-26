ActiveAdmin.register Contact do

  menu parent: "Registros", label: "Contactenos"

  permit_params :nombre, :email, :telefono, :mensaje, :estado_id

  # Create sections on the index screen
  scope :all, default: true

  scope :pendientes do |contactos|

          contactos.where(:estado_id => nil)

  end

  scope :atendidos do |contactos|

    estado_atendido = 3

          contactos.where(:estado_id => estado_atendido)

  end

  index do
    selectable_column
    id_column
    column :nombre
    column :email
    column :telefono
    column :mensaje
    column :estado
    column :created_at
    actions
  end

  filter :nombre
  filter :email
  filter :estado, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}
  filter :created_at  

  form do |f|
    f.inputs "Detalles de los comentarios" do
      f.input :nombre
      f.input :email
      f.input :telefono
       f.input :estado_id, :as => :select, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}
    end
    f.actions
  end

end
