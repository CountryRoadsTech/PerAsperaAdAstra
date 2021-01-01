class ApplicationController < ActionController::Base
  # Enables cross-site request forgery (CSRF) attack protections.
  protect_from_forgery with: :exception

  before_action :authenticate_user! # Requires any visitors to the website be signed in.

  before_action :set_paper_trail_whodunnit # Tracks which user made an edit to any model tracked by paper trail.

  include Pundit # Enables user authorization.
  after_action :verify_authorized # Verifies user authorization was performed on the current action.
end
