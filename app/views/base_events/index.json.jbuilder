json.array!(@base_events) do |base_event|
  json.extract! base_event, :id, :kind, :userID, :payload, :ClientTimeStamp
  json.url base_event_url(base_event, format: :json)
end
