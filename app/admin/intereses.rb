ActiveAdmin.register Interese do

menu parent: "Registros", label: "Interesados"

permit_params :usuario, :area, :prospecto, :estado_id
 
# Create sections on the index screen
  scope :all, default: true

  scope :pendientes do |interesado|

          interesado.where(:estado_id => nil)

  end

  scope :contactados do |interesado|

    estado_contactado = 4

          interesado.where(:estado_id => estado_contactado)

  end


  scope :seguimiento do |interesado|

    estado_seguimiento= 6

          interesado.where(:estado_id => estado_seguimiento)

  end

  scope :registrados do |interesado|

    estado_registrado = 5

          interesado.where(:estado_id => estado_registrado)

  end


   index do
      selectable_column
      id_column

      column :prospecto
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
      column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).empresa }
      column(:usuario_id) { |usuario| Usuario.find(usuario.usuario_id).profesion }
      
    end

   filter :id
   filter :created_at
   #filter :"subscription_billing_plan_name" , :as => :select, :collection => Usuario.order("email").all.map{ |usuario| [usuario.email, usuario.id]}
   #filter :usuario_id, :collection => Usuario.order("email").all.map{ |usuario| [usuario.email , usuario.id]}
   filter :usuario, :collection => Usuario.order("apellidos").all.map{ |usuario| [usuario.apellidos + " " + usuario.nombres , usuario.id]}
   filter :prospecto_id, :label => 'PROSPECTO ID'
   filter :prospecto, :collection => Prospecto.all.map{ |prospectos| [prospectos.nombre, prospectos.id]}
   filter :area, :collection => Area.all.map{ |areas| [areas.nombre, areas.id]}
   filter :estado, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}

 form do |f|
  f.inputs "Intereses" do
        f.input :estado, :as => :select, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}
 end
f.actions


end

end
