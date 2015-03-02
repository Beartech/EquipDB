class DashView < ActiveRecord::Base
  belongs_to :tool
  belongs_to :location
  belongs_to :category

end