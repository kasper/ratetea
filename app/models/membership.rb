class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :tea_club

end
