class DashView < ActiveRecord::Base
  belongs_to :tool
  belongs_to :location
  belongs_to :category

  #this is a model for a view in the DB called dash_views

end