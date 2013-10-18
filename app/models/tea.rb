class Tea < ActiveRecord::Base

  include RatingAverage

  validates :name, :variety, :presence => true

  belongs_to :variety
  belongs_to :brewery
  has_many :ratings, :dependent => :destroy
  has_many :raters, :through => :ratings, :source => :user

  def self.top(n)

    sorted_by_rating_in_desc_order = Tea.all.sort_by{ |tea| -tea.average_rating }
    sorted_by_rating_in_desc_order.first(n)

  end

  def to_s

    "#{name} (#{brewery.name})"

  end

end
