class Dropdown < ActiveRecord::Base
  has_many :locations
  has_many :categories

end
