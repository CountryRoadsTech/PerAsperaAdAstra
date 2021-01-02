class OrbitsController < ApplicationController
  before_action :set_orbit, only: [:show, :edit, :update, :destroy]

  # GET /orbits
  # GET /orbits.json
  def index
    @orbits = Orbit.all
  end

  # GET /orbits/1
  # GET /orbits/1.json
  def show
  end

  # GET /orbits/new
  def new
    @orbit = Orbit.new
  end

  # GET /orbits/1/edit
  def edit
  end

  # POST /orbits
  # POST /orbits.json
  def create
    @orbit = Orbit.new(orbit_params)

    respond_to do |format|
      if @orbit.save
        format.html { redirect_to @orbit, notice: 'Orbit was successfully created.' }
        format.json { render :show, status: :created, location: @orbit }
      else
        format.html { render :new }
        format.json { render json: @orbit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orbits/1
  # PATCH/PUT /orbits/1.json
  def update
    respond_to do |format|
      if @orbit.update(orbit_params)
        format.html { redirect_to @orbit, notice: 'Orbit was successfully updated.' }
        format.json { render :show, status: :ok, location: @orbit }
      else
        format.html { render :edit }
        format.json { render json: @orbit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orbits/1
  # DELETE /orbits/1.json
  def destroy
    @orbit.destroy
    respond_to do |format|
      format.html { redirect_to orbits_url, notice: 'Orbit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orbit
      @orbit = Orbit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orbit_params
      params.require(:orbit).permit(:satellites_id, :name, :comment, :user_id, :epoch, :epoch_microseconds, :mean_motion, :eccentricity, :inclination, :right_ascension_of_ascending_node, :argument_of_pericenter, :mean_anomaly, :revolution_at_epoch, :b_star, :mean_motion_dot, :mean_motino_ddot, :semimajor_axis, :period, :apogee, :perigee)
    end
end
