ActiveAdmin.register ExDocument do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :stock_company_id, :title, :link, :released_at, :short_link

end
