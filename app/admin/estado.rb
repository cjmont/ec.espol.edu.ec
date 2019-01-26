ActiveAdmin.register Estado do
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

    permit_params :id, :estado
 
    index do
        selectable_column
        id_column
        column :estado
        actions
    end

    filter :estado

    form do |f|
        f.inputs "Estado" do
            f.input :estado    
        end
        f.actions
    end

end
