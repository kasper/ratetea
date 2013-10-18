class TeasController < ApplicationController

  before_filter :ensure_that_signed_in, :except => [ :index, :show, :list ]
  before_action :set_tea, only: [:show, :edit, :update, :destroy]

  # GET /teas
  # GET /teas.json
  def index

    @order = 'name'

    if order_set.include?(params[:order])
      @order = params[:order]
    end

    @teas = Tea.all(:include => [ :variety, :brewery ]).sort_by{ |tea| tea.send(@order) }

    respond_to do |format|
      format.html
      format.json { render :json => @teas, :methods => [ :variety, :brewery ] }
    end

  end

  # GET /teas/1
  # GET /teas/1.json
  def show

    @rating = Rating.new
    @rating.tea = @tea

  end

  # GET /teas/new
  def new

    @tea = Tea.new
    @breweries = Brewery.all
    @varieties = Variety.all

  end

  # GET /teas/1/edit
  def edit

    @breweries = Brewery.all
    @varieties = Variety.all

  end

  # POST /teas
  # POST /teas.json
  def create

    @tea = Tea.new(tea_params)
    @breweries = Brewery.all
    @varieties = Variety.all

    respond_to do |format|

      if @tea.save

        [ 'teas-name', 'teas-variety', 'teas-brewery' ].each{ |f| expire_fragment(f) }

        format.html { redirect_to(teas_path) }
        format.json { render action: 'show', status: :created, location: @tea }

      else

        format.html { render action: 'new' }
        format.json { render json: @tea.errors, status: :unprocessable_entity }

      end

    end

  end

  # PATCH/PUT /teas/1
  # PATCH/PUT /teas/1.json
  def update

    @breweries = Brewery.all
    @varieties = Variety.all

    respond_to do |format|

      if @tea.update(tea_params)

        [ 'teas-name', 'teas-variety', 'teas-brewery' ].each{ |f| expire_fragment(f) }

        format.html { redirect_to(teas_path) }
        format.json { head :no_content }

      else

        format.html { render action: 'edit' }
        format.json { render json: @tea.errors, status: :unprocessable_entity }

      end

    end

  end

  # DELETE /teas/1
  # DELETE /teas/1.json
  def destroy

    @tea.destroy

    [ 'teas-name', 'teas-variety', 'teas-brewery' ].each{ |f| expire_fragment(f) }

    respond_to do |format|
      format.html { redirect_to teas_url }
      format.json { head :no_content }
    end

  end

  def list

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_tea
      @tea = Tea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tea_params
      params.require(:tea).permit(:name, :variety_id, :brewery_id)
    end

    def order_set

      [ 'name', 'variety', 'brewery' ]

    end

end
