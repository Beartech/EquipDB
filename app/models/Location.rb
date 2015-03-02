class Location < ActiveRecord::Base
  has_many :tools
  has_many :dash_views

end