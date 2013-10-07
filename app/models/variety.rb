class Variety < ActiveRecord::Base

  validates :name, :presence => true

  has_many :teas

  def to_s

    name

  end

end
