ActiveAdmin.register Usuario do


    menu label: "Usuario"

    permit_params :nombres, :apellidos, :tipo_id, :identificacion, :fecha_nac, :ciudad, :sexo, :domicilio,
                  :nivel_academico, :titulo, :institucion_proce, :profesion, :empresa, :movil, :telefono,
                  :telefono_emp, :email, :nivel_ingreso
    
    index do
        selectable_column
        id_column
        column :nombres
        column :apellidos
        column :tipo_id
        column :identificacion
        column :ciudad
        column :sexo
        column :domicilio
        column :movil
        column :telefono
        column :telefono_emp
        column :email

        actions
    end

     filter :id
    filter :nombres
    filter :apellidos
    filter :identificacion
    filter :fecha_nac
    filter :ciudad
    filter :sexo
    filter :nivel_academico
    filter :email
    filter :nivel_ingreso
    filter :created_at

    form do |f|
        f.inputs "Usuarios" do
            f.input :nombres
            f.input :apellidos
            f.input :tipo_id
            f.input :identificacion
            f.input :fecha_nac
            f.input :ciudad
            f.input :sexo
            f.input :domicilio
            f.input :nivel_academico
            f.input :titulo
            f.input :institucion_proce
            f.input :profesion
            f.input :empresa
            f.input :movil
            f.input :telefono
            f.input :telefono_emp
            f.input :email
            f.input :nivel_ingreso
        end
        f.actions
    end
end
