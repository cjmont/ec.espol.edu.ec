ActiveAdmin.register ClienteCorporativo do

    menu parent: "Registros", label: "Corporativo", priority: 1

    permit_params :nombre_curso, :empresa, :nombres, :apellidos, :email, :celular, :cargo, :fecha, :dias, :horaInicio, :horaFin, :participantes, :lugar, :problema, :estado

      # Create sections on the index screen
      scope :all, default: true

      scope :pendientes do |corporativo|

              corporativo.where(:estado_id => nil)

      end

      scope :atendidos do |corporativo|

        estado_atendido = 3

              corporativo.where(:estado_id => estado_atendido)

      end

    index do
        selectable_column
        id_column
        column :nombre_curso
        column :empresa
        column :nombres
        column :apellidos
        column :email
        column :celular
        column :estado
        column :created_at

        actions
    end

    filter :created_at
    filter :nombre_curso
    filter :empresa
    filter :nombres
    filter :apellidos
    filter :email
    filter :fecha
    filter :dias
    filter :estado, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}

    form do |f|
        f.inputs "Nivel" do
            f.input :nombres
            f.input :apellidos
            f.input :email
            f.input :celular
            f.input :estado, :as => :select, :collection => Estado.all.map{ |estado| [estado.estado, estado.id]}
        end
        f.actions
    end
end
