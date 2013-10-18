class Brewery < ActiveRecord::Base

  include RatingAverage

  validates :name, :presence => true
  validate :year_must_be_between_1042_and_now

  has_many :teas, :dependent => :destroy
  has_many :ratings, :through => :teas

  scope :active, -> { where(:active => true) }
  scope :retired, -> { where(:active => [ nil, false ]) }

  def self.top(n)

    sorted_by_rating_in_desc_order = Brewery.all.sort_by{ |brewery| -brewery.average_rating }
    sorted_by_rating_in_desc_order.first(n)

  end

  private

    def year_must_be_between_1042_and_now

      unless !year.nil? and year >= 1042 and year <= Time.now.year

        errors.add(:year, "must be between 1042 and #{Time.now.year}.")

      end

    end

end
