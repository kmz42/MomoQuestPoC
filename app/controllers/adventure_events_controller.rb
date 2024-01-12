class AdventureEventsController < ApplicationController
  before_action :set_adventure_event, only: %i[ show edit update destroy ]

  # GET /adventure_events or /adventure_events.json
  def index
    @adventure_events = AdventureEvent.all
  end

  # GET /adventure_events/1 or /adventure_events/1.json
  def show
  end

  # GET /adventure_events/new
  def new
    @adventure_event = AdventureEvent.new
  end

  # GET /adventure_events/1/edit
  def edit
  end

  # POST /adventure_events or /adventure_events.json
  def create
    @adventure_event = AdventureEvent.new(adventure_event_params)

    respond_to do |format|
      if @adventure_event.save
        format.html { redirect_to adventure_event_url(@adventure_event), notice: "Adventure event was successfully created." }
        format.json { render :show, status: :created, location: @adventure_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adventure_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adventure_events/1 or /adventure_events/1.json
  def update
    respond_to do |format|
      if @adventure_event.update(adventure_event_params)
        format.html { redirect_to adventure_event_url(@adventure_event), notice: "Adventure event was successfully updated." }
        format.json { render :show, status: :ok, location: @adventure_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adventure_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventure_events/1 or /adventure_events/1.json
  def destroy
    @adventure_event.destroy!

    respond_to do |format|
      format.html { redirect_to adventure_events_url, notice: "Adventure event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adventure_event
      @adventure_event = AdventureEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adventure_event_params
      params.require(:adventure_event).permit(:adventure_id, :event_id, :completes_adventure, :weight)
    end
end
