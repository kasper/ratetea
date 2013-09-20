class Brewery < ActiveRecord::Base

  include RatingAverage

  validates :name, :presence => true
  validate :year_must_be_between_1042_and_now

  has_many :teas, :dependent => :destroy
  has_many :ratings, :through => :teas

  private

    def year_must_be_between_1042_and_now

      unless year >= 1042 and year <= Time.now.year

        errors.add(:year, "must be between 1042 and #{Time.now.year}.")

      end

    end

end
