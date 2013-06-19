class Repair < ActiveRecord::Base
  belongs_to :tool
  has_many :parts

  accepts_nested_attributes_for :parts

  default_scope order('start_date DESC')
end
