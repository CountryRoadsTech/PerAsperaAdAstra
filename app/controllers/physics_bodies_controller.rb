# frozen_string_literal: true

# Defines all available HTTP actions for physics bodies.
class PhysicsBodiesController < ApplicationController
  before_action :set_physics_body, only: [:show, :edit, :update, :destroy]

  # GET /physics_bodies or /physics_bodies.json
  def index
    @physics_bodies = PhysicsBody.all
  end

  # GET /physics_bodies/1 or /physics_bodies/1.json
  def show
    # Redirect to the latest URL if an old URL was used.
    redirect_to @physics_body, status: :moved_permanently unless request.path == physics_body_path(@physics_body)
  end

  # GET /physics_bodies/new
  def new
    @physics_body = PhysicsBody.new
  end

  # GET /physics_bodies/1/edit
  def edit; end

  # POST /physics_bodies or /physics_bodies.json
  def create
    @physics_body = PhysicsBody.new(physics_body_params)

    respond_to do |format|
      if @physics_body.save
        format.html { redirect_to physics_body_url(@physics_body), notice: 'Physics body was successfully created.' }
        format.json { render :show, status: :created, location: @physics_body }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @physics_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /physics_bodies/1 or /physics_bodies/1.json
  def update
    respond_to do |format|
      if @physics_body.update(physics_body_params)
        format.html { redirect_to physics_body_url(@physics_body), notice: 'Physics body was successfully updated.' }
        format.json { render :show, status: :ok, location: @physics_body }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @physics_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physics_bodies/1 or /physics_bodies/1.json
  def destroy
    @physics_body.destroy

    respond_to do |format|
      format.html { redirect_to physics_bodies_url, notice: 'Physics body was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_physics_body
    @physics_body = PhysicsBody.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Render the 404 page if a slug was used that doesn't match any records.
    render file: "#{Rails.root}/public/404.html", status: :not_found and return
  end

  # Only allow a list of trusted parameters through.
  def physics_body_params
    params.require(:physics_body).permit(:simulation_id, :name, :description,
                                         :initial_position_x, :initial_position_y, :initial_position_z,
                                         :initial_velocity_x, :initial_velocity_y, :initial_velocity_z)
  end
end
