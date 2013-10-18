class MembershipsController < ApplicationController

  before_filter :ensure_that_signed_in

  def new

    @membership = Membership.new
    @tea_clubs = TeaClub.where.not(:id => current_user.tea_clubs)

  end

  def create

    membership = Membership.new(membership_params)

    # New membership
    unless current_user.tea_clubs.exists?(membership.tea_club_id)

      current_user.memberships << membership
      membership.save

    end

    redirect_to(user_path(current_user))

  end

  def confirm

    membership = Membership.find(params[:id])
    membership.confirmed = true

    if membership.tea_club.confirmed_member?(current_user)

      membership.save

      return redirect_to :back, :notice => 'Membership confirmed.'

    end

    redirect_to :back

  end

  private

    def membership_params

      params.require(:membership).permit(:tea_club_id)

    end

end
