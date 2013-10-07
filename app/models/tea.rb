class Tea < ActiveRecord::Base

  include RatingAverage

  validates :name, :variety, :presence => true

  belongs_to :variety
  belongs_to :brewery
  has_many :ratings, :dependent => :destroy
  has_many :raters, :through => :ratings, :source => :user

  def to_s

    "#{name} (#{brewery.name})"

  end

end
