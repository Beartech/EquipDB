class Part < ActiveRecord::Base
  has_and_belongs_to_many :service_types
end
