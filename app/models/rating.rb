class Rating < ActiveRecord::Base

  belongs_to :tea
  belongs_to :user

  def to_s

    "#{tea.name} #{score}"

  end

end
