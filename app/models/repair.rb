class Repair < ActiveRecord::Base
  belongs_to :tool
  has_many :service_types

  default_scope order('start_date DESC')
end
