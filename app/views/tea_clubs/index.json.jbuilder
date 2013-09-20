json.array!(@tea_clubs) do |tea_club|
  json.extract! tea_club, :name, :founded, :city
  json.url tea_club_url(tea_club, format: :json)
end
