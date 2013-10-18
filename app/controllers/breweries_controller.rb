class BreweriesController < ApplicationController

  before_filter :ensure_that_signed_in, :except => [ :index, :show ]
  before_filter :ensure_that_admin, :only => [ :destroy ]
  before_action :set_brewery, only: [:show, :edit, :update, :destroy]

  # GET /breweries
  # GET /breweries.json
  def index

    @order = 'name'

    if order_set.include?(params[:order])
      @order = params[:order]
    end

    @active_breweries = Brewery.active.sort_by{ |brewery| brewery.send(@order) }
    @retired_breweries = Brewery.retired.sort_by{ |brewery| brewery.send(@order) }

  end

  # GET /breweries/1
  # GET /breweries/1.json
  def show
  end

  # GET /breweries/new
  def new
    @brewery = Brewery.new
  end

  # GET /breweries/1/edit
  def edit
  end

  # POST /breweries
  # POST /breweries.json
  def create

    @brewery = Brewery.new(brewery_params)

    respond_to do |format|

      if @brewery.save

        [ 'breweries-name', 'breweries-year' ].each{ |f| expire_fragment(f) }

        format.html { redirect_to @brewery, notice: 'Brewery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @brewery }

      else

        format.html { render action: 'new' }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }

      end

    end

  end

  # PATCH/PUT /breweries/1
  # PATCH/PUT /breweries/1.json
  def update

    respond_to do |format|

      if @brewery.update(brewery_params)

        [ 'breweries-name', 'breweries-year' ].each{ |f| expire_fragment(f) }

        format.html { redirect_to @brewery, notice: 'Brewery was successfully updated.' }
        format.json { head :no_content }

      else

        format.html { render action: 'edit' }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end

    end

  end

  # DELETE /breweries/1
  # DELETE /breweries/1.json
  def destroy

    @brewery.destroy

    [ 'breweries-name', 'breweries-year' ].each{ |f| expire_fragment(f) }

    respond_to do |format|
      format.html { redirect_to breweries_url }
      format.json { head :no_content }
    end

  end

  def toggle_active

    brewery = Brewery.find(params[:id])
    brewery.update_attribute :active, (not brewery.active)

    new_status = brewery.active? ? 'active' : 'retired'

    redirect_to :back, :notice => "Brewery active status changed to #{new_status}."

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_brewery
      @brewery = Brewery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brewery_params
      params.require(:brewery).permit(:name, :year, :active)
    end

    def order_set

      [ 'name', 'year' ]

    end

end
