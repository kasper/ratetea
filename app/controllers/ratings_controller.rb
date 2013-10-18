class RatingsController < ApplicationController

  before_filter :ensure_that_signed_in, :except => [ :index ]

  def index

    unless fragment_exist?('ratings')

      @ratings = Rating.all
      @top_teas = Tea.top(3)
      @top_breweries = Brewery.top(3)
      @top_varieties = Variety.top(3)
      @top_active_users = User.top(3)
      @recent_ratings = Rating.recent

    end

  end

  def new

    @rating = Rating.new
    @teas = Tea.all

  end

  def create

    @rating = Rating.new(rating_params)

    if !current_user.nil? and @rating.save

      current_user.ratings << @rating
      redirect_to(user_path(current_user))

    else

      @teas = Tea.all

      render :new

    end

  end

  def destroy

    rating = Rating.find(params[:id])
    rating.delete if currently_signed_in?(rating.user)

    redirect_to(:back)

  end

  private

    def rating_params

      params.require(:rating).permit(:tea_id, :score)

    end

end
