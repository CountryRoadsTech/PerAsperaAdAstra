# Displays static HTMl pages not backed by a database model.
class PagesController < ApplicationController
  # GET /
  # GET /home
  def home
    authorize :pages, :home? # Ensure the user is allowed to perform this action.
  end
end
