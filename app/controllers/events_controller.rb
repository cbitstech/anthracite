class EventsController < ApplicationController

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

	def new
		@event = Event.new
	end

	def index
	end

	def create
		@event = Event.create(event_params)

		respond_to do |format|
			if @event.save
				format.json{render :json => @event, :status => :created, :location => @event }
			else
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@event = Event.find(params[:id])

		respond_to do |format|
		  	if @event.update(event_params)
				  format.json { head :no_content }
		  	else
		    format.json { render json: @event.errors, status: :unprocessable_entity }
		  end
		end
	end

  # todo: revise permissions? PHI concern?
	def show
		@event = Event.find(params[:id])
	end

	private
		def event_params
			params.require(:event).permit(:kind, :payload, :user_ID)
    end
  end
end
