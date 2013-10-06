class PlacesController < ApplicationController

  def show

    @place = TeamappingAPI.place(params[:id])
    @score = TeamappingAPI.score_for_place(params[:id])

  end

  def search

    @places = TeamappingAPI.places_in(params[:city])

    if @places.empty?
      redirect_to places_path, :notice => "No locations in #{params[:city].capitalize}."
    else
      render :index
    end

  end

end
