class TeaClubsController < ApplicationController

  before_filter :ensure_that_signed_in, :except => [ :index, :show ]
  before_action :set_tea_club, only: [:show, :edit, :update, :destroy]

  # GET /tea_clubs
  # GET /tea_clubs.json
  def index
    @tea_clubs = TeaClub.all
  end

  # GET /tea_clubs/1
  # GET /tea_clubs/1.json
  def show

    @membership = Membership.new

  end

  # GET /tea_clubs/new
  def new
    @tea_club = TeaClub.new
  end

  # GET /tea_clubs/1/edit
  def edit
  end

  # POST /tea_clubs
  # POST /tea_clubs.json
  def create
    @tea_club = TeaClub.new(tea_club_params)

    respond_to do |format|
      if @tea_club.save
        format.html { redirect_to @tea_club, notice: 'Tea club was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tea_club }
      else
        format.html { render action: 'new' }
        format.json { render json: @tea_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tea_clubs/1
  # PATCH/PUT /tea_clubs/1.json
  def update
    respond_to do |format|
      if @tea_club.update(tea_club_params)
        format.html { redirect_to @tea_club, notice: 'Tea club was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tea_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_clubs/1
  # DELETE /tea_clubs/1.json
  def destroy
    @tea_club.destroy
    respond_to do |format|
      format.html { redirect_to tea_clubs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tea_club
      @tea_club = TeaClub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tea_club_params
      params.require(:tea_club).permit(:name, :founded, :city)
    end
end
