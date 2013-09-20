class RatingsController < ApplicationController

  def index

    @ratings = Rating.all

  end

  def new

    @rating = Rating.new
    @teas = Tea.all

  end

  def create

    rating = Rating.create(rating_params)
    current_user.ratings << rating

    redirect_to(ratings_path)

  end

  def destroy

    rating = Rating.find(params[:id])
    rating.delete

    redirect_to(:back)

  end

  private

    def rating_params

      params.require(:rating).permit(:tea_id, :score)

    end

end
