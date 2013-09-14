class RatingsController < ApplicationController

  def index

    @ratings = Rating.all

  end

  def new

    @rating = Rating.new
    @teas = Tea.all

  end

  def create

    Rating.create(rating_params)

    redirect_to(ratings_path)

  end

  def destroy

    rating = Rating.find(params[:id])
    rating.delete

    redirect_to(ratings_path)

  end

  private

    def rating_params

      params.require(:rating).permit(:tea_id, :score)

    end

end
