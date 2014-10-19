# == Route Map
#
#                   Prefix Verb   URI Pattern                         Controller#Action
#               admin_root GET    /admin(.:format)                    admin/dashboard#index
#          admin_dashboard GET    /admin/dashboard(.:format)          admin/dashboard#index
# batch_action_admin_users POST   /admin/users/batch_action(.:format) admin/users#batch_action
#              admin_users GET    /admin/users(.:format)              admin/users#index
#                          POST   /admin/users(.:format)              admin/users#create
#           new_admin_user GET    /admin/users/new(.:format)          admin/users#new
#          edit_admin_user GET    /admin/users/:id/edit(.:format)     admin/users#edit
#               admin_user GET    /admin/users/:id(.:format)          admin/users#show
#                          PATCH  /admin/users/:id(.:format)          admin/users#update
#                          PUT    /admin/users/:id(.:format)          admin/users#update
#                          DELETE /admin/users/:id(.:format)          admin/users#destroy
#         new_user_session GET    /users/sign_in(.:format)            devise/sessions#new
#             user_session POST   /users/sign_in(.:format)            devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)           devise/sessions#destroy
#            user_password POST   /users/password(.:format)           devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)       devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)      devise/passwords#edit
#                          PATCH  /users/password(.:format)           devise/passwords#update
#                          PUT    /users/password(.:format)           devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)             devise/registrations#cancel
#        user_registration POST   /users(.:format)                    devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)            devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)               devise/registrations#edit
#                          PATCH  /users(.:format)                    devise/registrations#update
#                          PUT    /users(.:format)                    devise/registrations#update
#                          DELETE /users(.:format)                    devise/registrations#destroy
#                     root GET    /                                   welcome#index
#        letter_opener_web        /letter_opener                      LetterOpenerWeb::Engine
#
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id/delete(.:format)            letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment
#

Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # Letter opener web interface
  # See https://github.com/fgrehm/letter_opener_web
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
