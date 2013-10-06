class TeamappingAPI

  def self.key
    Settings.teamapping_api_key
  end

  def self.place(id)

    Rails.cache.write(id, fetch_place(id), :expires_in => 1.hour) unless Rails.cache.exist?(id)
    Rails.cache.read(id)

  end

  def self.fetch_place(id)

    url = "http://beermapping.com/webservice/locquery/#{key}/"

    response = HTTParty.get("#{url}#{id}")
    place = response.parsed_response['bmp_locations']['location']

    return nil if place['id'].to_i == 0

    Place.new(place)

  end

  def self.score_for_place(id)

    score_id = "score-#{id}"

    Rails.cache.write(score_id, fetch_score_for_place(id), :expires_in => 10.minutes) unless Rails.cache.exist?(score_id)
    Rails.cache.read(score_id)

  end

  def self.fetch_score_for_place(id)

    url = "http://beermapping.com/webservice/locscore/#{key}/"

    response = HTTParty.get("#{url}#{id}")
    score = response.parsed_response['bmp_locations']['location']['overall'].to_i

  end

  def self.places_in(city)

    city = city.downcase

    Rails.cache.write(city, fetch_places_in(city), :expires_in => 1.hour) unless Rails.cache.exist?(city)
    Rails.cache.read(city)

  end

  def self.fetch_places_in(city)

    url = "http://beermapping.com/webservice/loccity/#{key}/"

    response = HTTParty.get("#{url}#{city.gsub(' ', '%20')}")
    places = response.parsed_response['bmp_locations']['location']

    return [] if places.is_a?(Hash) and places['id'].nil?

    places = [places] if places.is_a?(Hash)

    return places.inject([]) do | set, place |
      set << Place.new(place)
    end

  end

end
