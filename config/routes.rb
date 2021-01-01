# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

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
