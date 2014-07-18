class EventsController < ApplicationController

	# protect_from_forgery with: :null_session

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

	def new
		@event = Event.new
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
					# @event.date_recorded = # timestamp from server receipt
					# @event.source = # source app or ip
		  	else
		    format.json { render json: @event.errors, status: :unprocessable_entity }
		  end
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	private
		def event_params
			params.require(:event).permit(:kind, :date_emitted, :payload, 
										  :shared_secret, :user_ID, :user_agent, :date_recorded, :source)
		end

end
