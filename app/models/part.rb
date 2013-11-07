class Part < ActiveRecord::Base
  belongs_to :repair
  belongs_to :service
end
