json.array!(@tracks) do |track|
  json.extract! track, :id, :name, :user_id, :description, :song
  json.url track_url(track, format: :json)
end
