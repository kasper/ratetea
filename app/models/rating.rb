class Rating < ActiveRecord::Base

  belongs_to :tea

  def to_s

    "#{tea.name} #{score}"

  end

end
