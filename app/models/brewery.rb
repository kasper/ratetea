class Brewery < ActiveRecord::Base

  include RatingAverage

  has_many :teas, :dependent => :destroy
  has_many :ratings, :through => :teas

end
