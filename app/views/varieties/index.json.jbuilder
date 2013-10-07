json.array!(@varieties) do |variety|
  json.extract! variety, :name, :description
  json.url variety_url(variety, format: :json)
end
