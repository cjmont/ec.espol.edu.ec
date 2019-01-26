ActiveAdmin.register PerfilPersonas do

    menu parent: "Prospectos", label: "Perfil Participante", priority: 4

    permit_params :texto, :contenido_id, :tipo, :tipo_requisito
 
    index do
        selectable_column
        id_column
        column :texto
        column :contenido_id
        column :tipo
        column :tipo_requisito
        actions
    end

    filter :texto
    filter :contenido_id
    filter :tipo
    filter :tipo_requisito

    form do |f|
        f.inputs "Perfil de Personas" do
            f.input :texto
            f.input :contenido, :collection => Contenido.all.map{ |contenido| ["Prospecto: " + Prospecto.find(contenido.prospecto_id).nombre, contenido.id]}
            f.input :tipo_requisito, :label => 'Tipo', :as => :select, :collection => ["Indispensable","Recomendado"]
            f.input :tipo, :label => 'Tipo', :as => :select, :collection => ["Párrafo","Viñeta"]
        end
        f.actions
    end
end