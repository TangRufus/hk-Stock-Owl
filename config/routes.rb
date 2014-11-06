# == Route Map
#
#                             Prefix Verb   URI Pattern                                   Controller#Action
#                      user_password POST   /users/password(.:format)                     devise/passwords#create
#                  new_user_password GET    /users/password/new(.:format)                 devise/passwords#new
#                 edit_user_password GET    /users/password/edit(.:format)                devise/passwords#edit
#                                    PATCH  /users/password(.:format)                     devise/passwords#update
#                                    PUT    /users/password(.:format)                     devise/passwords#update
#           cancel_user_registration GET    /users/cancel(.:format)                       devise/registrations#cancel
#                  user_registration POST   /users(.:format)                              devise/registrations#create
#              new_user_registration GET    /users/sign_up(.:format)                      devise/registrations#new
#             edit_user_registration GET    /users/edit(.:format)                         devise/registrations#edit
#                                    PATCH  /users(.:format)                              devise/registrations#update
#                                    PUT    /users(.:format)                              devise/registrations#update
#                                    DELETE /users(.:format)                              devise/registrations#destroy
#                  user_confirmation POST   /users/confirmation(.:format)                 confirmations#create
#              new_user_confirmation GET    /users/confirmation/new(.:format)             confirmations#new
#                                    GET    /users/confirmation(.:format)                 confirmations#show
#                        user_unlock POST   /users/unlock(.:format)                       devise/unlocks#create
#                    new_user_unlock GET    /users/unlock/new(.:format)                   devise/unlocks#new
#                                    GET    /users/unlock(.:format)                       devise/unlocks#show
#                   new_user_session GET    /login(.:format)                              devise/sessions#new
#                       user_session POST   /login(.:format)                              devise/sessions#create
#               destroy_user_session DELETE /logout(.:format)                             devise/sessions#destroy
#                            confirm PATCH  /confirm(.:format)                            confirmations#confirm
#                      new_user_join GET    /join(.:format)                               devise/registrations#new
#                resend_confirmation GET    /re-confirm(.:format)                         devise/confirmations#new
#                    forgot_password GET    /forgot-password(.:format)                    devise/passwords#new
#                     unlock_account GET    /unlock(.:format)                             devise/unlocks#new
#                               root GET    /                                             welcome#index
#                         admin_root GET    /admin(.:format)                              admin/dashboard#index
#                    admin_dashboard GET    /admin/dashboard(.:format)                    admin/dashboard#index
#    batch_action_admin_ex_documents POST   /admin/ex_documents/batch_action(.:format)    admin/ex_documents#batch_action
#                 admin_ex_documents GET    /admin/ex_documents(.:format)                 admin/ex_documents#index
#                                    POST   /admin/ex_documents(.:format)                 admin/ex_documents#create
#              new_admin_ex_document GET    /admin/ex_documents/new(.:format)             admin/ex_documents#new
#             edit_admin_ex_document GET    /admin/ex_documents/:id/edit(.:format)        admin/ex_documents#edit
#                  admin_ex_document GET    /admin/ex_documents/:id(.:format)             admin/ex_documents#show
#                                    PATCH  /admin/ex_documents/:id(.:format)             admin/ex_documents#update
#                                    PUT    /admin/ex_documents/:id(.:format)             admin/ex_documents#update
#                                    DELETE /admin/ex_documents/:id(.:format)             admin/ex_documents#destroy
#         batch_action_admin_ex_tags POST   /admin/ex_tags/batch_action(.:format)         admin/ex_tags#batch_action
#                      admin_ex_tags GET    /admin/ex_tags(.:format)                      admin/ex_tags#index
#                                    POST   /admin/ex_tags(.:format)                      admin/ex_tags#create
#                   new_admin_ex_tag GET    /admin/ex_tags/new(.:format)                  admin/ex_tags#new
#                  edit_admin_ex_tag GET    /admin/ex_tags/:id/edit(.:format)             admin/ex_tags#edit
#                       admin_ex_tag GET    /admin/ex_tags/:id(.:format)                  admin/ex_tags#show
#                                    PATCH  /admin/ex_tags/:id(.:format)                  admin/ex_tags#update
#                                    PUT    /admin/ex_tags/:id(.:format)                  admin/ex_tags#update
#                                    DELETE /admin/ex_tags/:id(.:format)                  admin/ex_tags#destroy
# batch_action_admin_stock_companies POST   /admin/stock_companies/batch_action(.:format) admin/stock_companies#batch_action
#              admin_stock_companies GET    /admin/stock_companies(.:format)              admin/stock_companies#index
#                                    POST   /admin/stock_companies(.:format)              admin/stock_companies#create
#            new_admin_stock_company GET    /admin/stock_companies/new(.:format)          admin/stock_companies#new
#           edit_admin_stock_company GET    /admin/stock_companies/:id/edit(.:format)     admin/stock_companies#edit
#                admin_stock_company GET    /admin/stock_companies/:id(.:format)          admin/stock_companies#show
#                                    PATCH  /admin/stock_companies/:id(.:format)          admin/stock_companies#update
#                                    PUT    /admin/stock_companies/:id(.:format)          admin/stock_companies#update
#                                    DELETE /admin/stock_companies/:id(.:format)          admin/stock_companies#destroy
#   batch_action_admin_subscriptions POST   /admin/subscriptions/batch_action(.:format)   admin/subscriptions#batch_action
#                admin_subscriptions GET    /admin/subscriptions(.:format)                admin/subscriptions#index
#                                    POST   /admin/subscriptions(.:format)                admin/subscriptions#create
#             new_admin_subscription GET    /admin/subscriptions/new(.:format)            admin/subscriptions#new
#            edit_admin_subscription GET    /admin/subscriptions/:id/edit(.:format)       admin/subscriptions#edit
#                 admin_subscription GET    /admin/subscriptions/:id(.:format)            admin/subscriptions#show
#                                    PATCH  /admin/subscriptions/:id(.:format)            admin/subscriptions#update
#                                    PUT    /admin/subscriptions/:id(.:format)            admin/subscriptions#update
#                                    DELETE /admin/subscriptions/:id(.:format)            admin/subscriptions#destroy
#           batch_action_admin_users POST   /admin/users/batch_action(.:format)           admin/users#batch_action
#                        admin_users GET    /admin/users(.:format)                        admin/users#index
#                                    POST   /admin/users(.:format)                        admin/users#create
#                     new_admin_user GET    /admin/users/new(.:format)                    admin/users#new
#                    edit_admin_user GET    /admin/users/:id/edit(.:format)               admin/users#edit
#                         admin_user GET    /admin/users/:id(.:format)                    admin/users#show
#                                    PATCH  /admin/users/:id(.:format)                    admin/users#update
#                                    PUT    /admin/users/:id(.:format)                    admin/users#update
#                                    DELETE /admin/users/:id(.:format)                    admin/users#destroy
#                      resque_server        /resque                                       Resque::Server
#

Rails.application.routes.draw do

  devise_for :users, :skip => [:sessions], :controllers => {:confirmations => 'confirmations'}
  as :user do
    # session controller
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    delete 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
    # confirmable
    patch 'confirm' => "confirmations#confirm"
    # seo links
    get 'join' => 'devise/registrations#new', :as => :new_user_join
    get 're-confirm' => 'devise/confirmations#new', :as => :resend_confirmation
    get 'forgot-password' => 'devise/passwords#new', :as => :forgot_password
    get 'unlock' => 'devise/unlocks#new', :as => :unlock_account
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  admin_constraint = lambda do |request|
    return true if Rails.env.development?
    request.env['warden'].authenticate? and request.env['warden'].user.admin?
  end

  constraints admin_constraint do
    ActiveAdmin.routes(self)
  end

  # Letter opener web interface
  # See https://github.com/fgrehm/letter_opener_web
  if Rails.env.development?
    mount Resque::Server, :at => "/resque"
  end
end
