class Repair < ActiveRecord::Base
  belongs_to :tool
  has_many :parts

  accepts_nested_attributes_for :parts
end
