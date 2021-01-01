class ApplicationController < ActionController::Base
  # Enables cross-site request forgery (CSRF) attack protections.
  protect_from_forgery with: :exception

  # Requires any vistors to the website be signed in.
  before_action :authenticate_user!
end
