class User < ActiveRecord::Base

  include RatingAverage

  has_secure_password

  validates_uniqueness_of :username
  validates_length_of :username, :minimum => 3, :maximum => 15
  validates_length_of :password, :minimum => 4
  validates :password, :format => { :with => /\A(?=.*[:alpha:])(?=.*[0-9]).*\z/,
                                    :message => 'must contain at least letters and numbers.' }

  has_many :ratings, :dependent => :destroy
  has_many :teas, :through => :ratings

  has_many :memberships
  has_many :tea_clubs, :through => :memberships

end
