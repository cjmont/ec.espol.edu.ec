ActiveAdmin.register Nivel do

    menu parent: "Prospectos", label: "Unidad", priority: 5

    permit_params :unidad, :credito, :nombre, :nivel_id, :contenido_id
 
    index do
        selectable_column
        id_column
        column :unidad
        column :credito
        column :nombre
        column :nivel_id
        column :contenido_id
        actions
    end

    filter :id
    filter :unidad
    filter :credito
    filter :nivel_id
    filter :contenido_id

    form do |f|
        f.inputs "Nivel" do
            f.input :unidad
            f.input :nombre
            f.input :credito
            f.input :contenido, :collection => Contenido.all.map{ |contenido| ["Prospecto: " + Prospecto.find(contenido.prospecto_id).nombre, contenido.id]}
            f.input :nivel, :collection => Nivel.all.map{ |nivel| ["'" + nivel.nombre + "' del Prospecto: " + Contenido.find(nivel.contenido_id).prospecto.nombre, nivel.id]}
        end
        f.actions
    end
end
