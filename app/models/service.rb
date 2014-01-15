class Service < ActiveRecord::Base
  belongs_to :tool
  has_one :service_type

  default_scope order('due_date DESC')
end
