json.array!(@teas) do |tea|
  json.extract! tea, :name, :variety, :brewery_id
  json.url tea_url(tea, format: :json)
end
