# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                            satellites GET    /satellites(.:format)                                                                    satellites#index
#                                       POST   /satellites(.:format)                                                                    satellites#create
#                         new_satellite GET    /satellites/new(.:format)                                                                satellites#new
#                        edit_satellite GET    /satellites/:id/edit(.:format)                                                           satellites#edit
#                             satellite GET    /satellites/:id(.:format)                                                                satellites#show
#                                       PATCH  /satellites/:id(.:format)                                                                satellites#update
#                                       PUT    /satellites/:id(.:format)                                                                satellites#update
#                                       DELETE /satellites/:id(.:format)                                                                satellites#destroy
#                      new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
#                          user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
#                  destroy_user_session DELETE /users/sign_out(.:format)                                                                users/sessions#destroy
#                     new_user_password GET    /users/password/new(.:format)                                                            users/passwords#new
#                    edit_user_password GET    /users/password/edit(.:format)                                                           users/passwords#edit
#                         user_password PATCH  /users/password(.:format)                                                                users/passwords#update
#                                       PUT    /users/password(.:format)                                                                users/passwords#update
#                                       POST   /users/password(.:format)                                                                users/passwords#create
#              cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
#                 new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
#                edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
#                     user_registration PATCH  /users(.:format)                                                                         users/registrations#update
#                                       PUT    /users(.:format)                                                                         users/registrations#update
#                                       DELETE /users(.:format)                                                                         users/registrations#destroy
#                                       POST   /users(.:format)                                                                         users/registrations#create
#                 new_user_confirmation GET    /users/confirmation/new(.:format)                                                        users/confirmations#new
#                     user_confirmation GET    /users/confirmation(.:format)                                                            users/confirmations#show
#                                       POST   /users/confirmation(.:format)                                                            users/confirmations#create
#                       new_user_unlock GET    /users/unlock/new(.:format)                                                              users/unlocks#new
#                           user_unlock GET    /users/unlock(.:format)                                                                  users/unlocks#show
#                                       POST   /users/unlock(.:format)                                                                  users/unlocks#create
#                                  home GET    /home(.:format)                                                                          pages#home
#                                  root GET    /                                                                                        pages#home
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  # Adds RESTful routes for satellites.
  resources :satellites

  # Adds routes for user authentication (i.e. /users/sign_in, ...)
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  # Adds routes for static HTML pages not backed by a database model.
  controller :pages do
    # /home
    get :home
  end

  # Sets the website's homepage, /, to /home.
  root 'pages#home'
end
