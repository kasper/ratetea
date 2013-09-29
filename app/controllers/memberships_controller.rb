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

  private

    def membership_params

      params.require(:membership).permit(:tea_club_id)

    end

end
