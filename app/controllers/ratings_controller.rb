class RatingsController < ApplicationController

  private

  def rating_params

    params.require(:rating).permit(:tea_id, :score)

  end

  public

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

end
