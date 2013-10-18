class TeaClub < ActiveRecord::Base

  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  def confirmed_memberships

    memberships.where(:confirmed => true)

  end

  def applied_memberships

    memberships.where(:confirmed => [ nil, false ])

  end

  def confirmed_member?(user)

    !confirmed_memberships.find_by(:user_id => user.id).nil?

  end

end
