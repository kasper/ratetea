class User < ActiveRecord::Base

  include RatingAverage

  has_many :ratings
  has_many :teas, :through => :ratings

end
