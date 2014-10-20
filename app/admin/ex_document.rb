ActiveAdmin.register ExDocument do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :link

  belongs_to :stock_company
  navigation_menu :stock_company

end
