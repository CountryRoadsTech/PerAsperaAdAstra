class SatellitesController < ApplicationController
  before_action :set_satellite, only: [:show, :edit, :update, :destroy]

  # GET /satellites
  # GET /satellites.json
  def index
    @satellites = authorize Satellite.includes(:orbit).all
    @satellite = authorize Satellite.new
  end

  # GET /satellites/1
  # GET /satellites/1.json
  def show
    authorize @satellite
  end

  # GET /satellites/new
  def new
    @satellite = authorize Satellite.new
  end

  # GET /satellites/1/edit
  def edit
    authorize @satellite
  end

  # POST /satellites
  # POST /satellites.json
  def create
    @satellite = authorize Satellite.new(satellite_params)
    @satellite.user = current_user

    respond_to do |format|
      if @satellite.save
        format.html { redirect_to @satellite, notice: 'Satellite was successfully created.' }
        format.json { render :show, status: :created, location: @satellite }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@satellite, partial: 'satellites/form', locals: { satellite: @satellite }) }
        format.html { render :new }
        format.json { render json: @satellite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /satellites/1
  # PATCH/PUT /satellites/1.json
  def update
    authorize @satellite

    respond_to do |format|
      if @satellite.update(satellite_params)
        format.html { redirect_to @satellite, notice: 'Satellite was successfully updated.' }
        format.json { render :show, status: :ok, location: @satellite }
      else
        format.html { render :edit }
        format.json { render json: @satellite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /satellites/1
  # DELETE /satellites/1.json
  def destroy
    authorize @satellite
    @satellite.destroy
    respond_to do |format|
      format.html { redirect_to satellites_url, notice: 'Satellite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_satellite
    @satellite = Satellite.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def satellite_params
    params.require(:satellite).permit(:norad_catalog_id,
                                      :international_designator,
                                      :user,
                                      :name,
                                      :object_type,
                                      :ordinal,
                                      :comment,
                                      :originator,
                                      :decayed,
                                      :epoch,
                                      :epoch_microseconds,
                                      :mean_motion,
                                      :eccentricity,
                                      :inclination,
                                      :right_ascension_of_ascending_node,
                                      :argument_of_pericenter,
                                      :mean_anomaly,
                                      :ephemeris_type,
                                      :element_set_number,
                                      :revolution_at_epoch,
                                      :b_star,
                                      :mean_motion_dot,
                                      :mean_motion_ddot,
                                      :semimajor_axis,
                                      :period,
                                      :apogee,
                                      :perigee
    )
  end
end
