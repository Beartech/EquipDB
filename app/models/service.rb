class Service < ActiveRecord::Base
  belongs_to :tool
  has_many :service_types



  default_scope order('due_date DESC')
end
