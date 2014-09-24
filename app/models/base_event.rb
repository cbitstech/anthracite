class BaseEvent < ActiveRecord::Base

  validates :kind, presence: true
  validates :payload, presence: true

  # todo: validate timestamp type using realCode
  # validates :ClientTimeStamp, iso8601: true

  rails_admin do
    configure :kind do
      label 'Event Kind: '
    end
  end

  rails_admin do
    configure :payload do
      label 'JSON payload: '
    end
  end
end

