class RatingsController < ApplicationController

  def index

    @ratings = Rating.all

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
