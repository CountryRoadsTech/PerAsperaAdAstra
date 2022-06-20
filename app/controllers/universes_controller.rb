# frozen_string_literal: true

# Defines all available HTTP actions for simulations.
class UniversesController < ApplicationController
  before_action :set_universe, only: [:show, :edit, :update, :destroy]

  # GET /universes/1 or /universes/1.json
  def show; end

  # GET /universes/1/edit
  def edit; end

  # POST /universes or /universes.json
  def create
    @universe = Universe.new(universe_params)

    respond_to do |format|
      if @universe.save
        format.html { redirect_to universe_url(@universe), notice: 'Universe was successfully created.' }
        format.json { render :show, status: :created, location: @universe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @universe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universes/1 or /universes/1.json
  def update
    respond_to do |format|
      if @universe.update(universe_params)
        format.html { redirect_to universe_url(@universe), notice: 'Universe was successfully updated.' }
        format.json { render :show, status: :ok, location: @universe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @universe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universes/1 or /universes/1.json
  def destroy
    @universe.destroy

    respond_to do |format|
      format.html { redirect_to universes_url, notice: 'Universe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_universe
    @universe = Universe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def universe_params
    params.require(:universe).permit(:simulation_id, :start_time, :end_time, :timestep, :number_of_timesteps)
  end
end
