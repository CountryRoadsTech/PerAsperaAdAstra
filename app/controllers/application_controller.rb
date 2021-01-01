class ApplicationController < ActionController::Base
  # Enables cross-site request forgery (CSRF) attack protections.
  protect_from_forgery with: :exception
end
