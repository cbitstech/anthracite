class BaseEventsController < ApplicationController

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  # GET /base_events

  def index
  end

  # GET /base_events/1
  # GET /base_events/1.json
  # todo: revise permissions? PHI concern?
  def show
  end

  # GET /base_events/new
  def new
    @base_event = BaseEvent.new
  end

  # GET /base_events/1/edit
  def edit
  end

  # POST /base_events
  # POST /base_events.json
  def create
    @base_event = BaseEvent.new(base_event_params)

    respond_to do |format|
      if @base_event.save
        format.json { render :json => @base_event, :status => :created, :location => @base_event}
      else
        format.json { render :json => @base_event.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /base_events/1
  # PATCH/PUT /base_events/1.json
  def update
    respond_to do |format|
      if @base_event.update(base_event_params)
        format.json { head :no_content }
      else
        format.json { render json: @base_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /base_events/1
  # DELETE /base_events/1.json
  # def destroy
  #  @base_event.destroy
  #  respond_to do |format|
  #    format.json { head :no_content }
  #  end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_event
      @base_event = BaseEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def base_event_params
      params.require(:base_event).permit(:kind, :userID, :payload, :clientTimeStamp)
    end
end
