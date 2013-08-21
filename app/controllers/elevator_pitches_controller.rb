class ElevatorPitchesController < ApplicationController
  before_action :set_elevator_pitch, only: [:show, :edit, :update, :destroy]

  def index
    @elevator_pitches = ElevatorPitch.all
  end

  def show
  end

  def new
    @elevator_pitch = ElevatorPitch.new
  end

  def edit
  end

  def create
    @elevator_pitch = ElevatorPitch.new(elevator_pitch_params)

    respond_to do |format|
      if @elevator_pitch.save
        format.html { redirect_to @elevator_pitch, notice: 'Elevator pitch was successfully created.' }
        format.json { render action: 'show', status: :created, location: @elevator_pitch }
      else
        format.html { render action: 'new' }
        format.json { render json: @elevator_pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @elevator_pitch.update(elevator_pitch_params)
        format.html { redirect_to @elevator_pitch, notice: 'Elevator pitch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @elevator_pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @elevator_pitch.destroy
    respond_to do |format|
      format.html { redirect_to elevator_pitches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elevator_pitch
      @elevator_pitch = ElevatorPitch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elevator_pitch_params
      params.require(:elevator_pitch).permit(:text, :request_id)
    end
end
