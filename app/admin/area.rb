ActiveAdmin.register Area do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

menu parent: "Prospectos"

permit_params :nombre, :nombre_corto, :sector, :imagen

# Create sections on the index screen
  scope :all, default: true

  scope :ciencias do |areas|

          areas.where(:sector => "ciencias")

  end

  scope :sociales do |areas|

          areas.where(:sector => "sociales")

  end

  scope :empresariales do |areas|

          areas.where(:sector => "empresariales")

  end

  scope :ingenieria_procesos do |areas|

          areas.where(:sector => "ingenieria y procesos")

  end

  scope :educativo do |areas|

          areas.where(:sector => "educativo")

  end

  scope :tic do |areas|

          areas.where(:sector => "tic")

  end




index do
	    selectable_column
	    id_column
	    column :nombre
	    column :nombre_corto
	    column :sector
	    column :imagen
	    actions
	  end
	   filter :id
	   filter :nombre
	   filter :nombre_corto
	   filter :sector, :as => :select, :collection => ["ciencias", "sociales", "empresariales", "ingenieria y procesos", "educativo", "tic" ]

	 form do |f|
	  f.inputs "Areas" do
	    f.input :nombre
	    f.input :nombre_corto
	    f.input :sector
	    f.input :imagen
	 	end
		f.actions
		end



end
