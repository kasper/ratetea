class Brewery < ActiveRecord::Base

  has_many :teas, :dependent => :destroy

end
