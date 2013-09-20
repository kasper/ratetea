class User < ActiveRecord::Base

  include RatingAverage

  has_many :ratings
  has_many :teas, :through => :ratings

  has_many :memberships
  has_many :tea_clubs, :through => :memberships

end
