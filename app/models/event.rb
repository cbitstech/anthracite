class Event < ActiveRecord::Base

	validates :type, presence: true
	validates :payload, presence: true

		rails_admin do
		  configure :type do
		    label 'Event Type: '
		  end
		end

		rails_admin do
		  configure :payload do
		    label 'JSON payload: '
		  end
		end
end
