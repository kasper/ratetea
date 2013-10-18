class Variety < ActiveRecord::Base

  include RatingAverage

  validates :name, :presence => true

  has_many :teas
  has_many :ratings, :through => :teas

  def self.top(n)

    sorted_by_rating_in_desc_order = Variety.all.sort_by{ |variety| -variety.average_rating }
    sorted_by_rating_in_desc_order.first(n)

  end

  def to_s

    name

  end

end
