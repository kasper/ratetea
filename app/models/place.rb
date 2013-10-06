class Place

  attr_accessor :id, :name, :status, :reviewlink, :proxylink, :blogmap, :street, :city, :state, :zip, :country, :phone, :overall, :imagecount

  def self.rendered_fields

    [ :id, :name, :status, :street, :city, :zip, :country, :overall ]

  end

  def initialize(attributes = {})

    attributes.each do |name, value|

      unless value.nil?

        if name == 'name' or name == 'status'

          replace = { 'Beer' => 'Tea',
                      'beer' => 'tea',
                      'Bar' => 'Cafe',
                      'bar' => 'cafe',
                      'Pub' => 'Cafeteria',
                      'pub' => 'cafeteria' }

          replace.each do |replace_key, replace_value|
            value.gsub!(replace_key, replace_value)
          end

        end

      end

      send("#{name}=", value)

    end

  end

end
