# frozen_string_literal: true

# Defines all available HTTP actions for simulations.
class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :edit, :update, :destroy]

  # GET /simulations or /simulations.json
  def index
    @simulations = Simulation.all
  end

  # GET /simulations/1 or /simulations/1.json
  def show
    # Redirect to the latest URL if an old URL was used.
    redirect_to @simulation, status: :moved_permanently unless request.path == simulation_path(@simulation)
  end

  # GET /simulations/new
  def new
    @simulation = Simulation.new
    @simulation.build_universe
  end

  # GET /simulations/1/edit
  def edit; end

  # POST /simulations or /simulations.json
  def create
    @simulation = Simulation.new(simulation_params)

    respond_to do |format|
      if @simulation.save
        format.html { redirect_to simulation_url(@simulation), notice: 'Simulation was successfully created.' }
        format.json { render :show, status: :created, location: @simulation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simulations/1 or /simulations/1.json
  def update
    respond_to do |format|
      if @simulation.update(simulation_params)
        format.html { redirect_to simulation_url(@simulation), notice: 'Simulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @simulation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulations/1 or /simulations/1.json
  def destroy
    @simulation.destroy

    respond_to do |format|
      format.html { redirect_to simulations_url, notice: 'Simulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_simulation
    @simulation = Simulation.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Render the 404 page if a slug was used that doesn't match any records.
    render file: "#{Rails.root}/public/404.html", status: :not_found and return
  end

  # Only allow a list of trusted parameters through.
  def simulation_params
    params.require(:simulation).permit(:name, :slug, :description, :solver_method, :computation_time, :computed_at,
                                       universe_attributes: [
                                         :_destroy, :id, :start_time, :end_time, :timestep, :number_of_timesteps
                                       ], physics_bodies_attributes: [
                                         :_destroy, :id, :name, :description,
                                         :initial_position_x, :initial_position_y, :initial_position_z,
                                         :initial_velocity_x, :initial_velocity_y, :initial_velocity_z
                                       ])
  end
end
