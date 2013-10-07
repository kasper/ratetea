class User < ActiveRecord::Base

  include RatingAverage

  has_secure_password

  validates_uniqueness_of :username
  validates_length_of :username, :minimum => 3, :maximum => 15
  validates_length_of :password, :minimum => 4
  validates :password, :format => { :with => /\A(?=.*[[:alpha:]])(?=.*[0-9]).*\z/,
                                    :message => 'must contain at least letters and numbers.' }

  has_many :ratings, :dependent => :destroy
  has_many :teas, :through => :ratings

  has_many :memberships
  has_many :tea_clubs, :through => :memberships

  def favourite_tea

    return nil if ratings.empty?
    ratings.sort_by { |rating| rating.score }.last.tea

  end

  def rated_varieties

    ratings.map { |rating| rating.tea.variety }.uniq

  end

  def variety_rating_average(variety)

    variety_ratings = ratings.select { |rating| rating.tea.variety == variety }
    return 0 if variety_ratings.empty?
    variety_ratings.inject(0.0) { |sum, r| sum + r.score } / variety_ratings.count

  end

  def favourite_variety

    return nil if ratings.empty?

    variety_rating_pairs = rated_varieties.inject([]) do |pairs, variety|
      pairs << [variety, variety_rating_average(variety)]
    end

    variety_rating_pairs.sort_by { |s| s.last }.last.first

  end

  def rated_breweries

    ratings.map { |rating| rating.tea.brewery }.uniq

  end

  def brewery_rating_average(brewery)

    brewery_ratings = ratings.select { |rating| rating.tea.brewery == brewery }
    return 0 if brewery_ratings.empty?
    brewery_ratings.inject(0.0) { |sum, r| sum + r.score } / brewery_ratings.count

  end

  def favourite_brewery

    return nil if ratings.empty?

    brewery_rating_pairs = rated_breweries.inject([]) do |pairs, brewery|
      pairs << [brewery, brewery_rating_average(brewery)]
    end

    brewery_rating_pairs.sort_by { |s| s.last }.last.first

  end

end
