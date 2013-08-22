json.array!(@background_informations) do |background_information|
  json.extract! background_information, :elevator_pitch, :background_information, :no_list, :what_can_go_wrong, :what_is_it_going_to_give, :what_is_the_frame, :request_id
  json.url background_information_url(background_information, format: :json)
end
