class Rating < ActiveRecord::Base

  validates_numericality_of :score,
                            :only_integer => true,
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 50

  belongs_to :tea
  belongs_to :user

  def to_s

    "#{tea.name} #{score}"

  end

end
