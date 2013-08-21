json.array!(@elevator_pitches) do |elevator_pitch|
  json.extract! elevator_pitch, :text, :request_id
  json.url elevator_pitch_url(elevator_pitch, format: :json)
end
