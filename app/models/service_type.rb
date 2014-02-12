class ServiceType < ActiveRecord::Base
  belongs_to :service
  belongs_to :repair
  has_and_belongs_to_many :parts

end
