# == Route Map
#
#                                    Prefix Verb   URI Pattern                                          Controller#Action
#                             user_password POST   /users/password(.:format)                            devise/passwords#create
#                         new_user_password GET    /users/password/new(.:format)                        devise/passwords#new
#                        edit_user_password GET    /users/password/edit(.:format)                       devise/passwords#edit
#                                           PATCH  /users/password(.:format)                            devise/passwords#update
#                                           PUT    /users/password(.:format)                            devise/passwords#update
#                  cancel_user_registration GET    /users/cancel(.:format)                              devise/registrations#cancel
#                         user_registration POST   /users(.:format)                                     devise/registrations#create
#                     new_user_registration GET    /users/sign_up(.:format)                             devise/registrations#new
#                    edit_user_registration GET    /users/edit(.:format)                                devise/registrations#edit
#                                           PATCH  /users(.:format)                                     devise/registrations#update
#                                           PUT    /users(.:format)                                     devise/registrations#update
#                                           DELETE /users(.:format)                                     devise/registrations#destroy
#                         user_confirmation POST   /users/confirmation(.:format)                        confirmations#create
#                     new_user_confirmation GET    /users/confirmation/new(.:format)                    confirmations#new
#                                           GET    /users/confirmation(.:format)                        confirmations#show
#                               user_unlock POST   /users/unlock(.:format)                              devise/unlocks#create
#                           new_user_unlock GET    /users/unlock/new(.:format)                          devise/unlocks#new
#                                           GET    /users/unlock(.:format)                              devise/unlocks#show
#                          new_user_session GET    /login(.:format)                                     devise/sessions#new
#                              user_session POST   /login(.:format)                                     devise/sessions#create
#                      destroy_user_session DELETE /logout(.:format)                                    devise/sessions#destroy
#                                   confirm PATCH  /confirm(.:format)                                   confirmations#confirm
#                             new_user_join GET    /join(.:format)                                      devise/registrations#new
#                       resend_confirmation GET    /re-confirm(.:format)                                devise/confirmations#new
#                           forgot_password GET    /forgot-password(.:format)                           devise/passwords#new
#                            unlock_account GET    /unlock(.:format)                                    devise/unlocks#new
#                                      root GET    /                                                    welcome#index
#                                admin_root GET    /admin(.:format)                                     admin/dashboard#index
#                           admin_dashboard GET    /admin/dashboard(.:format)                           admin/dashboard#index
#           batch_action_admin_ex_documents POST   /admin/ex_documents/batch_action(.:format)           admin/ex_documents#batch_action
#                        admin_ex_documents GET    /admin/ex_documents(.:format)                        admin/ex_documents#index
#                                           POST   /admin/ex_documents(.:format)                        admin/ex_documents#create
#                     new_admin_ex_document GET    /admin/ex_documents/new(.:format)                    admin/ex_documents#new
#                    edit_admin_ex_document GET    /admin/ex_documents/:id/edit(.:format)               admin/ex_documents#edit
#                         admin_ex_document GET    /admin/ex_documents/:id(.:format)                    admin/ex_documents#show
#                                           PATCH  /admin/ex_documents/:id(.:format)                    admin/ex_documents#update
#                                           PUT    /admin/ex_documents/:id(.:format)                    admin/ex_documents#update
#                                           DELETE /admin/ex_documents/:id(.:format)                    admin/ex_documents#destroy
# batch_action_admin_ex_headline_categories POST   /admin/ex_headline_categories/batch_action(.:format) admin/ex_headline_categories#batch_action
#              admin_ex_headline_categories GET    /admin/ex_headline_categories(.:format)              admin/ex_headline_categories#index
#                                           POST   /admin/ex_headline_categories(.:format)              admin/ex_headline_categories#create
#            new_admin_ex_headline_category GET    /admin/ex_headline_categories/new(.:format)          admin/ex_headline_categories#new
#           edit_admin_ex_headline_category GET    /admin/ex_headline_categories/:id/edit(.:format)     admin/ex_headline_categories#edit
#                admin_ex_headline_category GET    /admin/ex_headline_categories/:id(.:format)          admin/ex_headline_categories#show
#                                           PATCH  /admin/ex_headline_categories/:id(.:format)          admin/ex_headline_categories#update
#                                           PUT    /admin/ex_headline_categories/:id(.:format)          admin/ex_headline_categories#update
#                                           DELETE /admin/ex_headline_categories/:id(.:format)          admin/ex_headline_categories#destroy
#        batch_action_admin_stock_companies POST   /admin/stock_companies/batch_action(.:format)        admin/stock_companies#batch_action
#                     admin_stock_companies GET    /admin/stock_companies(.:format)                     admin/stock_companies#index
#                                           POST   /admin/stock_companies(.:format)                     admin/stock_companies#create
#                   new_admin_stock_company GET    /admin/stock_companies/new(.:format)                 admin/stock_companies#new
#                  edit_admin_stock_company GET    /admin/stock_companies/:id/edit(.:format)            admin/stock_companies#edit
#                       admin_stock_company GET    /admin/stock_companies/:id(.:format)                 admin/stock_companies#show
#                                           PATCH  /admin/stock_companies/:id(.:format)                 admin/stock_companies#update
#                                           PUT    /admin/stock_companies/:id(.:format)                 admin/stock_companies#update
#                                           DELETE /admin/stock_companies/:id(.:format)                 admin/stock_companies#destroy
#                  batch_action_admin_users POST   /admin/users/batch_action(.:format)                  admin/users#batch_action
#                               admin_users GET    /admin/users(.:format)                               admin/users#index
#                                           POST   /admin/users(.:format)                               admin/users#create
#                            new_admin_user GET    /admin/users/new(.:format)                           admin/users#new
#                           edit_admin_user GET    /admin/users/:id/edit(.:format)                      admin/users#edit
#                                admin_user GET    /admin/users/:id(.:format)                           admin/users#show
#                                           PATCH  /admin/users/:id(.:format)                           admin/users#update
#                                           PUT    /admin/users/:id(.:format)                           admin/users#update
#                                           DELETE /admin/users/:id(.:format)                           admin/users#destroy
#                         letter_opener_web        /letter_opener                                       LetterOpenerWeb::Engine
#                             resque_server        /admin/resque                                        Resque::Server
#
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id/delete(.:format)            letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment
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
    request.env['warden'].authenticate? and request.env['warden'].user.admin?
  end

  constraints admin_constraint do
    ActiveAdmin.routes(self)
  end

  # Letter opener web interface
  # See https://github.com/fgrehm/letter_opener_web
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
    mount Resque::Server, :at => "admin/resque"
  end
end
