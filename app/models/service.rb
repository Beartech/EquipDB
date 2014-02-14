class Service < ActiveRecord::Base
  belongs_to :tool
  belongs_to :service_type

  default_scope order('due_date DESC')
end
