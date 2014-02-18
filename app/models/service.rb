class Service < ActiveRecord::Base
  belongs_to :tool
  belongs_to :service_type
  has_many :expended_parts
  has_many :parts, through: :expended_parts

  default_scope order('due_date DESC')
end
