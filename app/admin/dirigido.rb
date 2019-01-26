ActiveAdmin.register Dirigido do

    menu parent: "Prospectos", label: "Dirigido a", priority: 3

    permit_params :texto, :contenido_id, :tipo
 
    index do
        selectable_column
        id_column
        column :texto
        column :contenido_id
        column :tipo
        actions
    end

    filter :texto
    filter :contenido_id
    filter :tipo

    form do |f|
        f.inputs "Dirigido a" do
            f.input :texto
            f.input :contenido, :collection => Contenido.all.map{ |contenido| ["Prospecto: " + Prospecto.find(contenido.prospecto_id).nombre, contenido.id]}
            f.input :tipo, :label => 'Tipo', :as => :select, :collection => ["Párrafo","Viñeta"]      
        end
        f.actions
    end
end
